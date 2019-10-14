abstract class Service {
  Future<bool> connect();
  Stream<dynamic> get received;
  void send(dynamic data,[dynamic param]);
}
