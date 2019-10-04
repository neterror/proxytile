import 'tile38_service.dart';
import 'gen/tile38.pb.dart';
import 'mqtt_service.dart';

class Tile38Commands {
  final Tile38Service _tile38Service;
  final MqttService _mqttService;

  final _commands = <Packet_Data, Function>{};

  Tile38Commands(this._tile38Service, this._mqttService) {
    _commands[Packet_Data.createHook] = _createHook;
    _commands[Packet_Data.genericCmd] = _genericCmd;
    _commands[Packet_Data.getHooks] = _getHooks;
    _commands[Packet_Data.delHook] = _delHook;
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

  String _areaStr(Area area) {
    if (area.whichData() == Area_Data.point) {
      return "POINT ${area.point.center.lat} ${area.point.center.lng} ${area.point.radius}";
    } else {
      return "OBJECT ${area.json.value}";
    }
  }

  _createHook(Packet packet) async {
    var hook = packet.createHook.hook;
    var topic = "${MqttService.rootTopic}${hook.group}";
    var now = DateTime.now().millisecondsSinceEpoch;
    var hookName = "${hook.group}_$now";
    var mqttHook =
        "SETHOOK $hookName mqtt://${_mqttService.server}:${_mqttService.port}/$topic/qos=1/retained=0";
    var fence = "${hook.command} ${hook.group} FENCE ${_areaStr(hook.area)}";
    var cmd = "$mqttHook $fence";
    var response = await _execute("$cmd");

    final report = Packet()..status = Status();
    if (response is int) {
      report.status.success = true;
    } else if (response is String) {
      report.status.success = false;
      report.status.message = response;
    }
    return report;
  }

  Area _getArea(List tokens) {
    final result = Area();
    String type = tokens[3];
    if (type.toLowerCase() == "object") {
      result.json = GeoJson()..value = tokens[4];
    } else {
      result.point = Point()..center = LatLng();
      result.point.center.lat = double.parse(tokens[4]);
      result.point.center.lng = double.parse(tokens[5]);
      result.point.radius = double.parse(tokens[6]);
    }
    return result;
  }

  Packet _hooksIn(List response) {
    final packet = Packet()..hookList = HookList();
    for (var item in response) {
      var hook = Hook();
      //[0] name, [1] group,[2] command, [3] fenceObject
      hook.name = item[0];
      hook.group = item[1];

      hook.command = Command.values
          .firstWhere((Command c) => c.name.startsWith(item[3][0]));
      hook.area = _getArea(item[3]);

      packet.hookList.items.add(hook);
    }
    return packet;
  }

  _getHooks(Packet packet) async {
    print("about to get hooks from pattern: ${packet.getHooks.pattern}");
    var response = await _execute("HOOKS ${packet.getHooks.pattern}");
    if (response is List) {
      return _hooksIn(response);
    }
  }

  _delHook(Packet packet) async {
    print("about to delete hook ${packet.delHook.pattern}");
    var response = await _execute("DELHOOK ${packet.delHook.pattern}");

    final report = Packet()..status = Status();
    report.status.success = (response != 0);
    if (!report.status.success) {
      report.status.message = "Failed to remove ${packet.delHook.pattern}";
    }
    return report;
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
