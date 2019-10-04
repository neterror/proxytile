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
    print("subscribed for mqtt events...");

    ///TODO - we need notification when the connection is terminated
  }

///{"command":"set","group":"5d973a064fe6c21fccc04f36","detect":"outside","hook":"group1_1570186604632","key":"group1","time":"2019-10-04T15:28:40.195756916+03:00","id":"plamen","object":{"type":"Point","coordinates":[27.976,43.217]}}

  void _fromMqtt(dynamic msg) {
    var json = jsonDecode(msg);
    var event = GeofenceEvent();
    event.command = json["command"];
    event.detect = Detection.values.firstWhere((x) => x.name == json['detect']);
    event.hook = json["hook"];
    event.group = json["key"];
    event.vehicle = json["id"];
    event.position = LatLng();
    event.position.lat = json["object"]["coordinates"][1];
    event.position.lng = json["object"]["coordinates"][0];

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
