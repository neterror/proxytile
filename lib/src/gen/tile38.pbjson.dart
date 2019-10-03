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

const CreateFence$json = const {
  '1': 'CreateFence',
  '2': const [
    const {'1': 'group', '3': 1, '4': 1, '5': 9, '10': 'group'},
    const {'1': 'detection', '3': 2, '4': 1, '5': 14, '6': '.Detection', '10': 'detection'},
    const {'1': 'command', '3': 3, '4': 1, '5': 14, '6': '.Command', '10': 'command'},
    const {'1': 'area', '3': 4, '4': 1, '5': 9, '10': 'area'},
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

const GeofenceEvent$json = const {
  '1': 'GeofenceEvent',
  '2': const [
    const {'1': 'detect', '3': 1, '4': 1, '5': 14, '6': '.Detection', '10': 'detect'},
    const {'1': 'hook', '3': 2, '4': 1, '5': 9, '10': 'hook'},
    const {'1': 'group', '3': 3, '4': 1, '5': 9, '10': 'group'},
    const {'1': 'vehicle', '3': 4, '4': 1, '5': 9, '10': 'vehicle'},
    const {'1': 'area', '3': 5, '4': 1, '5': 9, '10': 'area'},
  ],
};

const Packet$json = const {
  '1': 'Packet',
  '2': const [
    const {'1': 'createFence', '3': 1, '4': 1, '5': 11, '6': '.CreateFence', '9': 0, '10': 'createFence'},
    const {'1': 'genericCmd', '3': 2, '4': 1, '5': 11, '6': '.GenericCommand', '9': 0, '10': 'genericCmd'},
    const {'1': 'genericResponse', '3': 3, '4': 1, '5': 11, '6': '.GenericResponse', '9': 0, '10': 'genericResponse'},
    const {'1': 'geofenceEvent', '3': 4, '4': 1, '5': 11, '6': '.GeofenceEvent', '9': 0, '10': 'geofenceEvent'},
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

