import 'dart:convert';
import 'dart:core';
import 'package:proxytile/src/tile38_commands.dart';
import 'package:proxytile/src/tile38_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'mqtt_service.dart';
import 'gen/tile38.pb.dart';

class WebClient {
  WebSocketChannel _channel;
  final MqttService _mqttService;
  final Tile38Commands _tile38Commands;

  WebClient(this._mqttService, Tile38Service tile38Service)
      : _tile38Commands = Tile38Commands(tile38Service, _mqttService);

  void process(WebSocketChannel channel) async {
    print("new web client accepted");
    _channel = channel;
    channel.stream.listen(_onWebSocketData);
    _mqttService.received.listen(_fromMqtt);

    ///TODO - we need notification when the connection is terminated
  }

  final _detections = <String, Detection>{
    "enter": Detection.enter,
    "leave": Detection.leave,
    "inside": Detection.inside,
    "outside": Detection.outside,
    "cross": Detection.cross,
  };

  void _fromMqtt(MqttMsg msg) {
    List<int> chars = msg.data.toList();
    var text = String.fromCharCodes(chars);

    var json = jsonDecode(text);
    var event = GeofenceEvent();
    event.detect = _detections[json['detect']];
    event.group = json["key"];
    event.vehicle = json["id"];
    var pos = LatLng();
    pos.lat = json["object"]["coordinates"][1];
    pos.lng = json["object"]["coordinates"][0];

    event.position = pos;

    var packet = Packet();
    packet.geofenceEvent = event;
    _channel.sink.add(packet.writeToBuffer());
  }

  ///
  ///  Input handler from the websocket
  ///
  ///  ProtoBuf service dispatcher
  void _onWebSocketData(var msg) async {
    Packet packet = Packet.fromBuffer(msg);
    var response = await _tile38Commands.process(packet);
    if (response is Packet) {
      _channel.sink.add(response.writeToBuffer());
    }
  }
}
