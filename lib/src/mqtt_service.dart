import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:typed_data';
import 'package:typed_data/typed_buffers.dart';

class MqttMsg {
  String topic;
  Uint8List data;
  MqttMsg(this.topic, this.data);
}

class MqttService {
  static const _defaultServer = "0.0.0.0";
  static const _defaultPort = 8131;
  static const _defaultUser = "";
  static const _defaultPass = "";

  StreamController<MqttMsg> _mqttCtrl = StreamController<MqttMsg>.broadcast();

  MqttClient _client;
  MqttService({String server = _defaultServer, int port = _defaultPort}) {
    print("connecting to mqtt server: $server :  $port");
    _client = MqttClient.withPort(server, "__dev_test__", port);
    _client.onConnected = () {
      print("Connected to MQTT broker");
      _client.updates.listen((var messages) {
        for (var m in messages) {
          MqttPublishMessage msg = m.payload;
          Uint8List data = Uint8List.fromList(msg.payload.message.toList());
          _mqttCtrl.add(MqttMsg(m.topic, data));
        }
      });
    };
    _client.onDisconnected = () => print("Disconnected from the MQTT broker");
    _client.onSubscribed = (topic) => print("subscribed to $topic");
    _client.onSubscribeFail = (err) => print("failed to subscribe: $err");
  }

  Future connect(
          {String user = _defaultUser, String password = _defaultPass}) =>
      _client.connect(user, password);

  void subscribe(String topic) {
    _client.subscribe(topic, MqttQos.atMostOnce);
  }

  Stream<MqttMsg> receive() async* {
    await for (var messages in _client.updates) {
      for (var m in messages) {
        MqttPublishMessage msg = m.payload;
        Uint8List data = Uint8List.fromList(msg.payload.message.toList());
        print("received new data");
        yield MqttMsg(m.topic, data);
      }
    }
  }

  void publish(String topic, Uint8List data) {
    Uint8Buffer buf = Uint8Buffer();
    buf.addAll(data);
    _client.publishMessage(topic, MqttQos.atMostOnce, buf);
  }


}
