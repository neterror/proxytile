import 'dart:convert';
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
  }

  _createFence(Packet request) {
    print("Request to create geofence object: ${request.createFence}");
  }

  _genericCmd(Packet request) async {
    String cmd = request.genericCmd.command;
    List<String> tokens = cmd.split(" ");
    var response = await _tile38Service.send(tokens);
    var packet = Packet();
    packet.genericResponse = GenericResponse();
    if (response is String) {
      packet.genericResponse.response = response;
    } else {
      var encoder = JsonEncoder.withIndent("   ");
      packet.genericResponse.response = encoder.convert(response); //scanall returns some dynamic lists instead of json
    }
    return packet.writeToBuffer();
  }

  ///
  ///  Input handler from the websocket
  ///
  ///  ProtoBuf service dispatcher
  void _onWebSocketData(var msg) async {
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
