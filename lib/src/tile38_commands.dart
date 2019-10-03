import 'tile38_service.dart';
import 'gen/tile38.pb.dart';
import 'mqtt_service.dart';

class Tile38Commands {
  final Tile38Service _tile38Service;
  final MqttService _mqttService;
  
  final _commands = <Packet_Data, Function>{};

  Tile38Commands(this._tile38Service, this._mqttService) {
    _commands[Packet_Data.createFence] = _createFence;
    _commands[Packet_Data.genericCmd] = _genericCmd;
    _commands[Packet_Data.getHooks] = _getHooks;
  }

  Future<Packet> process(Packet command) async {
    Packet result;
    var cmd = command.whichData();
    if (_commands.containsKey(cmd)) {
      result = await _commands[cmd](command);
    }
    return result;
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

  _getHooks(Packet packet) async {
    print("get hooks invoked!");
    var response = await _execute("HOOKS ${packet.getHooks.pattern}");
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
}
