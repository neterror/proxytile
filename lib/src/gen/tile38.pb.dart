///
//  Generated code. Do not modify.
//  source: tile38.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'tile38.pbenum.dart';

export 'tile38.pbenum.dart';

class GenericCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GenericCommand')
    ..aOS(1, 'command')
    ..hasRequiredFields = false
  ;

  GenericCommand._() : super();
  factory GenericCommand() => create();
  factory GenericCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenericCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GenericCommand clone() => GenericCommand()..mergeFromMessage(this);
  GenericCommand copyWith(void Function(GenericCommand) updates) => super.copyWith((message) => updates(message as GenericCommand));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenericCommand create() => GenericCommand._();
  GenericCommand createEmptyInstance() => create();
  static $pb.PbList<GenericCommand> createRepeated() => $pb.PbList<GenericCommand>();
  static GenericCommand getDefault() => _defaultInstance ??= create()..freeze();
  static GenericCommand _defaultInstance;

  $core.String get command => $_getS(0, '');
  set command($core.String v) { $_setString(0, v); }
  $core.bool hasCommand() => $_has(0);
  void clearCommand() => clearField(1);
}

class GenericResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GenericResponse')
    ..aOS(1, 'response')
    ..hasRequiredFields = false
  ;

  GenericResponse._() : super();
  factory GenericResponse() => create();
  factory GenericResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenericResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GenericResponse clone() => GenericResponse()..mergeFromMessage(this);
  GenericResponse copyWith(void Function(GenericResponse) updates) => super.copyWith((message) => updates(message as GenericResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenericResponse create() => GenericResponse._();
  GenericResponse createEmptyInstance() => create();
  static $pb.PbList<GenericResponse> createRepeated() => $pb.PbList<GenericResponse>();
  static GenericResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GenericResponse _defaultInstance;

  $core.String get response => $_getS(0, '');
  set response($core.String v) { $_setString(0, v); }
  $core.bool hasResponse() => $_has(0);
  void clearResponse() => clearField(1);
}

class Point extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Point')
    ..a<LatLng>(1, 'center', $pb.PbFieldType.OM, LatLng.getDefault, LatLng.create)
    ..a<$core.double>(2, 'radius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Point._() : super();
  factory Point() => create();
  factory Point.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Point.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Point clone() => Point()..mergeFromMessage(this);
  Point copyWith(void Function(Point) updates) => super.copyWith((message) => updates(message as Point));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Point create() => Point._();
  Point createEmptyInstance() => create();
  static $pb.PbList<Point> createRepeated() => $pb.PbList<Point>();
  static Point getDefault() => _defaultInstance ??= create()..freeze();
  static Point _defaultInstance;

  LatLng get center => $_getN(0);
  set center(LatLng v) { setField(1, v); }
  $core.bool hasCenter() => $_has(0);
  void clearCenter() => clearField(1);

  $core.double get radius => $_getN(1);
  set radius($core.double v) { $_setDouble(1, v); }
  $core.bool hasRadius() => $_has(1);
  void clearRadius() => clearField(2);
}

class GeoJson extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GeoJson')
    ..aOS(1, 'value')
    ..hasRequiredFields = false
  ;

  GeoJson._() : super();
  factory GeoJson() => create();
  factory GeoJson.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeoJson.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GeoJson clone() => GeoJson()..mergeFromMessage(this);
  GeoJson copyWith(void Function(GeoJson) updates) => super.copyWith((message) => updates(message as GeoJson));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeoJson create() => GeoJson._();
  GeoJson createEmptyInstance() => create();
  static $pb.PbList<GeoJson> createRepeated() => $pb.PbList<GeoJson>();
  static GeoJson getDefault() => _defaultInstance ??= create()..freeze();
  static GeoJson _defaultInstance;

  $core.String get value => $_getS(0, '');
  set value($core.String v) { $_setString(0, v); }
  $core.bool hasValue() => $_has(0);
  void clearValue() => clearField(1);
}

enum Area_Data {
  point, 
  json, 
  notSet
}

class Area extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Area_Data> _Area_DataByTag = {
    1 : Area_Data.point,
    2 : Area_Data.json,
    0 : Area_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Area')
    ..oo(0, [1, 2])
    ..a<Point>(1, 'point', $pb.PbFieldType.OM, Point.getDefault, Point.create)
    ..a<GeoJson>(2, 'json', $pb.PbFieldType.OM, GeoJson.getDefault, GeoJson.create)
    ..hasRequiredFields = false
  ;

  Area._() : super();
  factory Area() => create();
  factory Area.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Area.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Area clone() => Area()..mergeFromMessage(this);
  Area copyWith(void Function(Area) updates) => super.copyWith((message) => updates(message as Area));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Area create() => Area._();
  Area createEmptyInstance() => create();
  static $pb.PbList<Area> createRepeated() => $pb.PbList<Area>();
  static Area getDefault() => _defaultInstance ??= create()..freeze();
  static Area _defaultInstance;

  Area_Data whichData() => _Area_DataByTag[$_whichOneof(0)];
  void clearData() => clearField($_whichOneof(0));

  Point get point => $_getN(0);
  set point(Point v) { setField(1, v); }
  $core.bool hasPoint() => $_has(0);
  void clearPoint() => clearField(1);

  GeoJson get json => $_getN(1);
  set json(GeoJson v) { setField(2, v); }
  $core.bool hasJson() => $_has(1);
  void clearJson() => clearField(2);
}

class GeofenceEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GeofenceEvent')
    ..e<Detection>(1, 'detect', $pb.PbFieldType.OE, Detection.enter, Detection.valueOf, Detection.values)
    ..aOS(2, 'command')
    ..aOS(3, 'hook')
    ..aOS(4, 'group')
    ..aOS(5, 'vehicle')
    ..a<LatLng>(6, 'position', $pb.PbFieldType.OM, LatLng.getDefault, LatLng.create)
    ..hasRequiredFields = false
  ;

  GeofenceEvent._() : super();
  factory GeofenceEvent() => create();
  factory GeofenceEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeofenceEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GeofenceEvent clone() => GeofenceEvent()..mergeFromMessage(this);
  GeofenceEvent copyWith(void Function(GeofenceEvent) updates) => super.copyWith((message) => updates(message as GeofenceEvent));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeofenceEvent create() => GeofenceEvent._();
  GeofenceEvent createEmptyInstance() => create();
  static $pb.PbList<GeofenceEvent> createRepeated() => $pb.PbList<GeofenceEvent>();
  static GeofenceEvent getDefault() => _defaultInstance ??= create()..freeze();
  static GeofenceEvent _defaultInstance;

  Detection get detect => $_getN(0);
  set detect(Detection v) { setField(1, v); }
  $core.bool hasDetect() => $_has(0);
  void clearDetect() => clearField(1);

  $core.String get command => $_getS(1, '');
  set command($core.String v) { $_setString(1, v); }
  $core.bool hasCommand() => $_has(1);
  void clearCommand() => clearField(2);

  $core.String get hook => $_getS(2, '');
  set hook($core.String v) { $_setString(2, v); }
  $core.bool hasHook() => $_has(2);
  void clearHook() => clearField(3);

  $core.String get group => $_getS(3, '');
  set group($core.String v) { $_setString(3, v); }
  $core.bool hasGroup() => $_has(3);
  void clearGroup() => clearField(4);

  $core.String get vehicle => $_getS(4, '');
  set vehicle($core.String v) { $_setString(4, v); }
  $core.bool hasVehicle() => $_has(4);
  void clearVehicle() => clearField(5);

  LatLng get position => $_getN(5);
  set position(LatLng v) { setField(6, v); }
  $core.bool hasPosition() => $_has(5);
  void clearPosition() => clearField(6);
}

class Hook extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Hook')
    ..aOS(1, 'name')
    ..aOS(2, 'group')
    ..e<Command>(3, 'command', $pb.PbFieldType.OE, Command.nearby, Command.valueOf, Command.values)
    ..e<Detection>(4, 'detection', $pb.PbFieldType.OE, Detection.enter, Detection.valueOf, Detection.values)
    ..a<Area>(5, 'area', $pb.PbFieldType.OM, Area.getDefault, Area.create)
    ..hasRequiredFields = false
  ;

  Hook._() : super();
  factory Hook() => create();
  factory Hook.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hook.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Hook clone() => Hook()..mergeFromMessage(this);
  Hook copyWith(void Function(Hook) updates) => super.copyWith((message) => updates(message as Hook));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Hook create() => Hook._();
  Hook createEmptyInstance() => create();
  static $pb.PbList<Hook> createRepeated() => $pb.PbList<Hook>();
  static Hook getDefault() => _defaultInstance ??= create()..freeze();
  static Hook _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $core.String get group => $_getS(1, '');
  set group($core.String v) { $_setString(1, v); }
  $core.bool hasGroup() => $_has(1);
  void clearGroup() => clearField(2);

  Command get command => $_getN(2);
  set command(Command v) { setField(3, v); }
  $core.bool hasCommand() => $_has(2);
  void clearCommand() => clearField(3);

  Detection get detection => $_getN(3);
  set detection(Detection v) { setField(4, v); }
  $core.bool hasDetection() => $_has(3);
  void clearDetection() => clearField(4);

  Area get area => $_getN(4);
  set area(Area v) { setField(5, v); }
  $core.bool hasArea() => $_has(4);
  void clearArea() => clearField(5);
}

class LatLng extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LatLng')
    ..a<$core.double>(1, 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, 'lng', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  LatLng._() : super();
  factory LatLng() => create();
  factory LatLng.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LatLng.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LatLng clone() => LatLng()..mergeFromMessage(this);
  LatLng copyWith(void Function(LatLng) updates) => super.copyWith((message) => updates(message as LatLng));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LatLng create() => LatLng._();
  LatLng createEmptyInstance() => create();
  static $pb.PbList<LatLng> createRepeated() => $pb.PbList<LatLng>();
  static LatLng getDefault() => _defaultInstance ??= create()..freeze();
  static LatLng _defaultInstance;

  $core.double get lat => $_getN(0);
  set lat($core.double v) { $_setDouble(0, v); }
  $core.bool hasLat() => $_has(0);
  void clearLat() => clearField(1);

  $core.double get lng => $_getN(1);
  set lng($core.double v) { $_setDouble(1, v); }
  $core.bool hasLng() => $_has(1);
  void clearLng() => clearField(2);
}

class CreateHook extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateHook')
    ..a<Hook>(1, 'hook', $pb.PbFieldType.OM, Hook.getDefault, Hook.create)
    ..hasRequiredFields = false
  ;

  CreateHook._() : super();
  factory CreateHook() => create();
  factory CreateHook.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateHook.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateHook clone() => CreateHook()..mergeFromMessage(this);
  CreateHook copyWith(void Function(CreateHook) updates) => super.copyWith((message) => updates(message as CreateHook));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateHook create() => CreateHook._();
  CreateHook createEmptyInstance() => create();
  static $pb.PbList<CreateHook> createRepeated() => $pb.PbList<CreateHook>();
  static CreateHook getDefault() => _defaultInstance ??= create()..freeze();
  static CreateHook _defaultInstance;

  Hook get hook => $_getN(0);
  set hook(Hook v) { setField(1, v); }
  $core.bool hasHook() => $_has(0);
  void clearHook() => clearField(1);
}

class SetObj extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetObj')
    ..aOS(1, 'group')
    ..aOS(2, 'object')
    ..a<Area>(3, 'area', $pb.PbFieldType.OM, Area.getDefault, Area.create)
    ..hasRequiredFields = false
  ;

  SetObj._() : super();
  factory SetObj() => create();
  factory SetObj.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetObj.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetObj clone() => SetObj()..mergeFromMessage(this);
  SetObj copyWith(void Function(SetObj) updates) => super.copyWith((message) => updates(message as SetObj));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetObj create() => SetObj._();
  SetObj createEmptyInstance() => create();
  static $pb.PbList<SetObj> createRepeated() => $pb.PbList<SetObj>();
  static SetObj getDefault() => _defaultInstance ??= create()..freeze();
  static SetObj _defaultInstance;

  $core.String get group => $_getS(0, '');
  set group($core.String v) { $_setString(0, v); }
  $core.bool hasGroup() => $_has(0);
  void clearGroup() => clearField(1);

  $core.String get object => $_getS(1, '');
  set object($core.String v) { $_setString(1, v); }
  $core.bool hasObject() => $_has(1);
  void clearObject() => clearField(2);

  Area get area => $_getN(2);
  set area(Area v) { setField(3, v); }
  $core.bool hasArea() => $_has(2);
  void clearArea() => clearField(3);
}

class Status extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Status')
    ..aOB(1, 'success')
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  Status._() : super();
  factory Status() => create();
  factory Status.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Status.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Status clone() => Status()..mergeFromMessage(this);
  Status copyWith(void Function(Status) updates) => super.copyWith((message) => updates(message as Status));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => $pb.PbList<Status>();
  static Status getDefault() => _defaultInstance ??= create()..freeze();
  static Status _defaultInstance;

  $core.bool get success => $_get(0, false);
  set success($core.bool v) { $_setBool(0, v); }
  $core.bool hasSuccess() => $_has(0);
  void clearSuccess() => clearField(1);

  $core.String get message => $_getS(1, '');
  set message($core.String v) { $_setString(1, v); }
  $core.bool hasMessage() => $_has(1);
  void clearMessage() => clearField(2);
}

class GetHooks extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetHooks')
    ..aOS(1, 'pattern')
    ..hasRequiredFields = false
  ;

  GetHooks._() : super();
  factory GetHooks() => create();
  factory GetHooks.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHooks.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetHooks clone() => GetHooks()..mergeFromMessage(this);
  GetHooks copyWith(void Function(GetHooks) updates) => super.copyWith((message) => updates(message as GetHooks));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetHooks create() => GetHooks._();
  GetHooks createEmptyInstance() => create();
  static $pb.PbList<GetHooks> createRepeated() => $pb.PbList<GetHooks>();
  static GetHooks getDefault() => _defaultInstance ??= create()..freeze();
  static GetHooks _defaultInstance;

  $core.String get pattern => $_getS(0, '');
  set pattern($core.String v) { $_setString(0, v); }
  $core.bool hasPattern() => $_has(0);
  void clearPattern() => clearField(1);
}

class HookList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HookList')
    ..pc<Hook>(2, 'items', $pb.PbFieldType.PM,Hook.create)
    ..hasRequiredFields = false
  ;

  HookList._() : super();
  factory HookList() => create();
  factory HookList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HookList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HookList clone() => HookList()..mergeFromMessage(this);
  HookList copyWith(void Function(HookList) updates) => super.copyWith((message) => updates(message as HookList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HookList create() => HookList._();
  HookList createEmptyInstance() => create();
  static $pb.PbList<HookList> createRepeated() => $pb.PbList<HookList>();
  static HookList getDefault() => _defaultInstance ??= create()..freeze();
  static HookList _defaultInstance;

  $core.List<Hook> get items => $_getList(0);
}

class DelHook extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DelHook')
    ..aOS(1, 'pattern')
    ..hasRequiredFields = false
  ;

  DelHook._() : super();
  factory DelHook() => create();
  factory DelHook.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelHook.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DelHook clone() => DelHook()..mergeFromMessage(this);
  DelHook copyWith(void Function(DelHook) updates) => super.copyWith((message) => updates(message as DelHook));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelHook create() => DelHook._();
  DelHook createEmptyInstance() => create();
  static $pb.PbList<DelHook> createRepeated() => $pb.PbList<DelHook>();
  static DelHook getDefault() => _defaultInstance ??= create()..freeze();
  static DelHook _defaultInstance;

  $core.String get pattern => $_getS(0, '');
  set pattern($core.String v) { $_setString(0, v); }
  $core.bool hasPattern() => $_has(0);
  void clearPattern() => clearField(1);
}

enum Packet_Data {
  genericCmd, 
  genericResponse, 
  createHook, 
  getHooks, 
  hookList, 
  delHook, 
  status, 
  geofenceEvent, 
  setObj, 
  notSet
}

class Packet extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Packet_Data> _Packet_DataByTag = {
    1 : Packet_Data.genericCmd,
    2 : Packet_Data.genericResponse,
    3 : Packet_Data.createHook,
    4 : Packet_Data.getHooks,
    5 : Packet_Data.hookList,
    6 : Packet_Data.delHook,
    7 : Packet_Data.status,
    8 : Packet_Data.geofenceEvent,
    9 : Packet_Data.setObj,
    0 : Packet_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Packet')
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9])
    ..a<GenericCommand>(1, 'genericCmd', $pb.PbFieldType.OM, GenericCommand.getDefault, GenericCommand.create)
    ..a<GenericResponse>(2, 'genericResponse', $pb.PbFieldType.OM, GenericResponse.getDefault, GenericResponse.create)
    ..a<CreateHook>(3, 'createHook', $pb.PbFieldType.OM, CreateHook.getDefault, CreateHook.create)
    ..a<GetHooks>(4, 'getHooks', $pb.PbFieldType.OM, GetHooks.getDefault, GetHooks.create)
    ..a<HookList>(5, 'hookList', $pb.PbFieldType.OM, HookList.getDefault, HookList.create)
    ..a<DelHook>(6, 'delHook', $pb.PbFieldType.OM, DelHook.getDefault, DelHook.create)
    ..a<Status>(7, 'status', $pb.PbFieldType.OM, Status.getDefault, Status.create)
    ..a<GeofenceEvent>(8, 'geofenceEvent', $pb.PbFieldType.OM, GeofenceEvent.getDefault, GeofenceEvent.create)
    ..a<SetObj>(9, 'setObj', $pb.PbFieldType.OM, SetObj.getDefault, SetObj.create)
    ..hasRequiredFields = false
  ;

  Packet._() : super();
  factory Packet() => create();
  factory Packet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Packet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Packet clone() => Packet()..mergeFromMessage(this);
  Packet copyWith(void Function(Packet) updates) => super.copyWith((message) => updates(message as Packet));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Packet create() => Packet._();
  Packet createEmptyInstance() => create();
  static $pb.PbList<Packet> createRepeated() => $pb.PbList<Packet>();
  static Packet getDefault() => _defaultInstance ??= create()..freeze();
  static Packet _defaultInstance;

  Packet_Data whichData() => _Packet_DataByTag[$_whichOneof(0)];
  void clearData() => clearField($_whichOneof(0));

  GenericCommand get genericCmd => $_getN(0);
  set genericCmd(GenericCommand v) { setField(1, v); }
  $core.bool hasGenericCmd() => $_has(0);
  void clearGenericCmd() => clearField(1);

  GenericResponse get genericResponse => $_getN(1);
  set genericResponse(GenericResponse v) { setField(2, v); }
  $core.bool hasGenericResponse() => $_has(1);
  void clearGenericResponse() => clearField(2);

  CreateHook get createHook => $_getN(2);
  set createHook(CreateHook v) { setField(3, v); }
  $core.bool hasCreateHook() => $_has(2);
  void clearCreateHook() => clearField(3);

  GetHooks get getHooks => $_getN(3);
  set getHooks(GetHooks v) { setField(4, v); }
  $core.bool hasGetHooks() => $_has(3);
  void clearGetHooks() => clearField(4);

  HookList get hookList => $_getN(4);
  set hookList(HookList v) { setField(5, v); }
  $core.bool hasHookList() => $_has(4);
  void clearHookList() => clearField(5);

  DelHook get delHook => $_getN(5);
  set delHook(DelHook v) { setField(6, v); }
  $core.bool hasDelHook() => $_has(5);
  void clearDelHook() => clearField(6);

  Status get status => $_getN(6);
  set status(Status v) { setField(7, v); }
  $core.bool hasStatus() => $_has(6);
  void clearStatus() => clearField(7);

  GeofenceEvent get geofenceEvent => $_getN(7);
  set geofenceEvent(GeofenceEvent v) { setField(8, v); }
  $core.bool hasGeofenceEvent() => $_has(7);
  void clearGeofenceEvent() => clearField(8);

  SetObj get setObj => $_getN(8);
  set setObj(SetObj v) { setField(9, v); }
  $core.bool hasSetObj() => $_has(8);
  void clearSetObj() => clearField(9);
}

