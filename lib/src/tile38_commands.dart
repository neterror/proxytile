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
    _commands[Packet_Data.setObj] = _setObj;
  }

  Future<Packet> process(Packet command) async {
    Packet result;
    var cmd = command.whichData();
    if (_commands.containsKey(cmd)) {
      result = await _commands[cmd](command);
    }
    return result;
  }

  Future<dynamic> _execute(String request) async {
    List<String> tokens = request.split(" ");
    _tile38Service.send(tokens);
    return await _tile38Service.received.first;
  }

  String _areaStr(Area area) {
    String result = "";
    switch (area.whichData()) {
      case Area_Data.json:
        result = "OBJECT ${area.json.value}";
        break;
      case Area_Data.point:
        result = "POINT ${area.point.center.lat} ${area.point.center.lng}";
        if (area.point.radius != 0) result += " ${area.point.radius}";
        break;
      case Area_Data.notSet:
        break;
    }
    return result;
  }

  _createHook(Packet packet) async {
    var hook = packet.createHook.hook;
    var topic = "${MqttService.rootTopic}/${hook.group}";
    var now = DateTime.now().millisecondsSinceEpoch;
    var hookName = "${hook.group}_$now";
    var mqttHook =
        "SETHOOK $hookName mqtt://${_mqttService.server}:${_mqttService.port}/$topic/qos=0/retained=0";
    var fence = "${hook.command} ${hook.group} FENCE ${_areaStr(hook.area)}";
    var cmd = "$mqttHook $fence";
    print("cmd: $cmd");
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
    final areaTokens = {"object", "point", "bounds"};
    int areaStart = tokens.indexWhere((x) => areaTokens.contains(
        x.toLowerCase())); //there is optional detection clause before that

    String type = tokens[areaStart];
    if (type.toLowerCase() == "object") {
      result.json = GeoJson()..value = tokens[areaStart + 1];
    } else {
      result.point = Point()..center = LatLng();
      result.point.center.lat = double.parse(tokens[areaStart + 1]);
      result.point.center.lng = double.parse(tokens[areaStart + 2]);
      result.point.radius = double.parse(tokens[areaStart + 3]);
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
    var response = await _execute("HOOKS ${packet.getHooks.pattern}");
    if (response is List) {
      return _hooksIn(response);
    }
  }

  _delHook(Packet packet) async {
    var response = await _execute("DELHOOK ${packet.delHook.pattern}");

    final report = Packet()..status = Status();
    report.status.success = (response != 0);
    if (!report.status.success) {
      report.status.message = "Failed to remove ${packet.delHook.pattern}";
    }
    return report;
  }

  _setObj(Packet packet) async {
    final obj = packet.setObj;
    await _execute("SET ${obj.group} ${obj.object} ${_areaStr(obj.area)}");
  }

  _genericCmd(Packet request) async {
    dynamic response = await _execute(request.genericCmd.command);
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
