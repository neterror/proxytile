///
//  Generated code. Do not modify.
//  source: tile38.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Detection$json = const {
  '1': 'Detection',
  '2': const [
    const {'1': 'enter', '2': 0},
    const {'1': 'leave', '2': 1},
    const {'1': 'inside', '2': 2},
    const {'1': 'outside', '2': 4},
    const {'1': 'cross', '2': 8},
    const {'1': 'all', '2': 31},
  ],
};

const Command$json = const {
  '1': 'Command',
  '2': const [
    const {'1': 'nearby', '2': 0},
    const {'1': 'within', '2': 1},
    const {'1': 'intersects', '2': 2},
  ],
};

const GenericCommand$json = const {
  '1': 'GenericCommand',
  '2': const [
    const {'1': 'command', '3': 1, '4': 1, '5': 9, '10': 'command'},
  ],
};

const GenericResponse$json = const {
  '1': 'GenericResponse',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 9, '10': 'response'},
  ],
};

const Point$json = const {
  '1': 'Point',
  '2': const [
    const {'1': 'center', '3': 1, '4': 1, '5': 11, '6': '.LatLng', '10': 'center'},
    const {'1': 'radius', '3': 2, '4': 1, '5': 1, '10': 'radius'},
  ],
};

const GeoJson$json = const {
  '1': 'GeoJson',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

const Area$json = const {
  '1': 'Area',
  '2': const [
    const {'1': 'point', '3': 1, '4': 1, '5': 11, '6': '.Point', '9': 0, '10': 'point'},
    const {'1': 'json', '3': 2, '4': 1, '5': 11, '6': '.GeoJson', '9': 0, '10': 'json'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

const GeofenceEvent$json = const {
  '1': 'GeofenceEvent',
  '2': const [
    const {'1': 'detect', '3': 1, '4': 1, '5': 14, '6': '.Detection', '10': 'detect'},
    const {'1': 'hookName', '3': 2, '4': 1, '5': 9, '10': 'hookName'},
    const {'1': 'group', '3': 3, '4': 1, '5': 9, '10': 'group'},
    const {'1': 'vehicle', '3': 4, '4': 1, '5': 9, '10': 'vehicle'},
    const {'1': 'position', '3': 5, '4': 1, '5': 11, '6': '.LatLng', '10': 'position'},
  ],
};

const Hook$json = const {
  '1': 'Hook',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'group', '3': 2, '4': 1, '5': 9, '10': 'group'},
    const {'1': 'command', '3': 3, '4': 1, '5': 14, '6': '.Command', '10': 'command'},
    const {'1': 'detection', '3': 4, '4': 1, '5': 14, '6': '.Detection', '10': 'detection'},
    const {'1': 'area', '3': 5, '4': 1, '5': 11, '6': '.Area', '10': 'area'},
  ],
};

const LatLng$json = const {
  '1': 'LatLng',
  '2': const [
    const {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    const {'1': 'lng', '3': 2, '4': 1, '5': 1, '10': 'lng'},
  ],
};

const CreateHook$json = const {
  '1': 'CreateHook',
  '2': const [
    const {'1': 'hook', '3': 1, '4': 1, '5': 11, '6': '.Hook', '10': 'hook'},
  ],
};

const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

const GetHooks$json = const {
  '1': 'GetHooks',
  '2': const [
    const {'1': 'pattern', '3': 1, '4': 1, '5': 9, '10': 'pattern'},
  ],
};

const HookList$json = const {
  '1': 'HookList',
  '2': const [
    const {'1': 'items', '3': 2, '4': 3, '5': 11, '6': '.Hook', '10': 'items'},
  ],
};

const Packet$json = const {
  '1': 'Packet',
  '2': const [
    const {'1': 'genericCmd', '3': 1, '4': 1, '5': 11, '6': '.GenericCommand', '9': 0, '10': 'genericCmd'},
    const {'1': 'genericResponse', '3': 2, '4': 1, '5': 11, '6': '.GenericResponse', '9': 0, '10': 'genericResponse'},
    const {'1': 'createHook', '3': 3, '4': 1, '5': 11, '6': '.CreateHook', '9': 0, '10': 'createHook'},
    const {'1': 'getHooks', '3': 4, '4': 1, '5': 11, '6': '.GetHooks', '9': 0, '10': 'getHooks'},
    const {'1': 'hooks', '3': 5, '4': 1, '5': 11, '6': '.HookList', '9': 0, '10': 'hooks'},
    const {'1': 'status', '3': 6, '4': 1, '5': 11, '6': '.Status', '9': 0, '10': 'status'},
    const {'1': 'geofenceEvent', '3': 7, '4': 1, '5': 11, '6': '.GeofenceEvent', '9': 0, '10': 'geofenceEvent'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

