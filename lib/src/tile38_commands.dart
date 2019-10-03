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

  Area _getArea(List tokens) {
    final result = Area();
    String type = tokens[3];
    if (type.toLowerCase() == "object") {
      result.json = GeoJson()..json = tokens[4];
    } else {
      result.point = Point()..center = LatLng();
      result.point.center.lat = double.parse(tokens[4]);
      result.point.center.lng = double.parse(tokens[5]);
      result.point.radius = double.parse(tokens[6]);
    }
    return result;
  }

  Packet _hooksIn(List response) {
    final packet = Packet()..hooks = HookList();
    for (var item in response) {
      var hook = Hook();
      //[0] name, [1] group,[2] command, [3] fenceObject
      hook.hookName = item[0];
      hook.group = item[1];

      hook.command = Command.values
          .firstWhere((Command c) => c.name.startsWith(item[3][0]));
      hook.area = _getArea(item[3]);

      packet.hooks.items.add(hook);
    }
    return packet;
  }

  _getHooks(Packet packet) async {
    print("get hooks invoked!");
    var response = await _execute("HOOKS ${packet.getHooks.pattern}");
    if (response is List) {
      return _hooksIn(response);
    }
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
