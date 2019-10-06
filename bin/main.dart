import 'dart:io';
import 'package:proxytile/src/tile38_service.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:args/args.dart';
import 'package:proxytile/src/webclient.dart';
import 'package:proxytile/src/mqtt_service.dart';

void _main(List<String> args) async {
  var parser = ArgParser();
  parser.addOption('listen',
      help: "WebSocket port for web clients", defaultsTo: '8888');

  parser.addOption('tile-host', help: "Tile38 host", defaultsTo: 'localhost');
  parser.addOption('tile-port', help: "Tile38 port", defaultsTo: '9851');
  parser.addOption('mqtt-host', help: "MQTT host", defaultsTo: 'localhost');
  parser.addOption('mqtt-port', help: "MQTT port", defaultsTo: '1883');

  var options;
  try {
    options = parser.parse(args);
  } on ArgParserException {
    print(parser.usage);
    return;
  }

  final mqttService = MqttService(
      server: options['mqtt-host'], port: int.parse(options['mqtt-port']));
  final tile38Service = Tile38Service(
      server: options['tile-host'], port: int.parse(options['tile-port']));
  print("connecting to the MQTT broker");
  await mqttService.connect();
  print("connecting to tile38 server on ${options['tile-host']}");
  bool connected = await tile38Service.connect();
  if (!connected) {
    exit(0);
  }

  print("starting web socket on port ${options['listen']}");
  var handler = webSocketHandler(
      (socket) => WebClient(mqttService, tile38Service).process(socket));
  await shelf_io.serve(handler, "0.0.0.0", int.parse(options['listen']));
}

main(List<String> args) async {
  Chain.capture(() => _main(args), onError: (e, chain) => print(chain.terse));
}
