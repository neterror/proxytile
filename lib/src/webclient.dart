import 'dart:convert';
import 'dart:typed_data';
import 'dart:core';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'mqtt_service.dart';
import 'tile38_service.dart';
import 'gen/tile38.pb.dart';

class WebClient {
  WebSocketChannel _channel;
  final MqttService _mqttService;
  final Tile38Service _tile38Service;
  WebClient(this._mqttService, this._tile38Service);

  void process(WebSocketChannel channel) async {
    print("new web client accepted");
    _channel = channel;
    channel.stream.listen(_onWebSocketData);
    _mqttService.received.listen(_fromMqtt);

    ///TODO - we need notification when the connection is terminated
  }

  dynamic _execute(String request) async {
    List<String> tokens = request.split(" ");
    return await _tile38Service.send(tokens);
  }

  _createFence(Packet request) async {
    var req = request.createFence;
    var topic = "${MqttService.rootTopic}${req.group}";
    var mqttHook =
        "SETHOOK hook_of_${req.group} mqtt://${_mqttService.server}:${_mqttService.port}/$topic/qos=1/retained=0";
    var fence = "${req.command} ${req.group} FENCE ${req.area}";
    var cmd = "$mqttHook $fence";
    var response = await _execute("$cmd");
    print(response);
  }

  _genericCmd(Packet request) async {
    var response = await _execute(request.genericCmd.command);
    var packet = Packet();
    packet.genericResponse = GenericResponse();
    if (response is String) {
      packet.genericResponse.response = response;
    } else {
      //scanall returns some dynamic lists instead of json
      packet.genericResponse.response = response.toString();
    }
    return packet.writeToBuffer();
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
    event.area = json["object"].toString();

    var packet = Packet();
    packet.geofenceEvent = event;
    _channel.sink.add(packet.writeToBuffer());
  }

  ///
  ///  Input handler from the websocket
  ///
  ///  ProtoBuf service dispatcher
  void _onWebSocketData(var msg) async {
    print("received event: $msg");
    Packet packet = Packet.fromBuffer(msg);
    final cmd = <Packet_Data, Function>{
      //dispatcher map from
      Packet_Data.createFence: _createFence,
      Packet_Data.genericCmd: _genericCmd,
    };
    if (cmd.containsKey(packet.whichData())) {
      var response = await cmd[packet.whichData()](packet);
      if (response != null) {
        _channel.sink.add(response);
      }
    }
  }
}

/*
mqtt.topic: geofence//group1/qos=1/retained=0, 
{"command":"set","group":"5d95aa864fe6c21fccc04f2d","detect":"inside",
"hook":"hook_of_group1","key":"group1","time":"2019-10-03T11:08:57.813702237+03:00","id":"trabant",
"object":{"type":"Point","coordinates":[27.91723,43.20125]}}: 

{"command":"set","group":"5d95aa864fe6c21fccc04f2d","detect":"inside","hook":"hook_of_group1","key":"group1","time":"2019-10-03T11:08:57.813702237+03:00","id":"trabant","object":{"type":"Point","coordinates":[27.91723,43.20125]}}

*/
