import 'dart:async';
import 'package:redis/redis.dart';
import 'service.dart';

class Tile38Service implements Service {
  final _streamController = StreamController.broadcast();

  Command _command;
  String server;
  int port;
  Tile38Service({this.server, this.port});
  final _connection = RedisConnection();

  @override
  Stream get received => _streamController.stream;

  @override
  Future<bool> connect() async {
    bool success = false;
    try {
      _command = await _connection.connect(server, port);
      success = true;
    } on Exception {
      print("Failed to connect to tile38 server on $server:$port");
    }
    return success;
  }

  @override
  void send(dynamic data) {
    if (data is! List<String>) {
      print("Tile38 service expects list of strings for sending");
    } else {
      _command
          .send_object(data)
          .then((result) => _streamController.sink.add(result))
          .catchError((e) => _streamController.sink.add(e.toString()));
    }
  }
}
