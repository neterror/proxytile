import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'dart:typed_data';
import 'service.dart';
import 'package:typed_data/typed_buffers.dart';

class MqttService implements Service {
  static const rootTopic = "geofence";
  String server;
  int port;
  String user;
  String password;

  StreamController _mqttCtrl = StreamController.broadcast();

  @override
  Stream get received => _mqttCtrl.stream;

  MqttClient _client;
  MqttService({this.server, this.port, this.user = "", this.password = ""}) {
    print("connecting to mqtt server: $server :  $port");
    _client = MqttClient.withPort(server, "__dev_test__", port);
    _client.onConnected = () {
      print("Connected to MQTT broker");
      _client.updates.listen(_mqttReceived);
      _client.subscribe("$rootTopic/#", MqttQos.atMostOnce);
    };

    _client.onDisconnected = () => print("Disconnected from the MQTT broker");
    _client.onSubscribed = (topic) => print("subscribed to $topic");
    _client.onSubscribeFail = (err) => print("failed to subscribe: $err");
  }

  void _mqttReceived(var messages) {
    for (var m in messages) {
      MqttPublishMessage msg = m.payload;
      Uint8List data = Uint8List.fromList(msg.payload.message.toList());
      String incoming = String.fromCharCodes(data);
      _mqttCtrl.sink.add(incoming);
    }
  }

  @override
  Future<bool> connect() async {
    await _client.connect(user, password);
    return _client.connectionStatus.state == MqttConnectionState.connected;
  }

  void subscribe(String topic) {
    _client.subscribe(topic, MqttQos.atMostOnce);
  }

  void publish(String topic, Uint8Buffer data) =>
      _client.publishMessage(topic, MqttQos.atMostOnce, data);

  @override
  void send(dynamic message, [dynamic param]) => publish(param, message);
}
