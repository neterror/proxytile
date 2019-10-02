import 'dart:async';
import 'package:redis/redis.dart';

class Tile38Service {
  Command _command;
  String server;
  int port;
  Tile38Service({this.server, this.port});
  final _connection = RedisConnection();

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

  /// Sends data and receives response
  dynamic send(List<String> data) async {
    dynamic result;
    try {
      result = result = await _command.send_object(data);
    } on RedisError catch (e) {
      print(e.toString());
      result = e.toString();
    }

    return result;
  }
}
