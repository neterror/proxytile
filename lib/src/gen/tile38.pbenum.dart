///
//  Generated code. Do not modify.
//  source: tile38.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class Detection extends $pb.ProtobufEnum {
  static const Detection enter = Detection._(0, 'enter');
  static const Detection leave = Detection._(1, 'leave');
  static const Detection inside = Detection._(2, 'inside');
  static const Detection outside = Detection._(3, 'outside');
  static const Detection cross = Detection._(4, 'cross');

  static const $core.List<Detection> values = <Detection> [
    enter,
    leave,
    inside,
    outside,
    cross,
  ];

  static final $core.Map<$core.int, Detection> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Detection valueOf($core.int value) => _byValue[value];

  const Detection._($core.int v, $core.String n) : super(v, n);
}

class Command extends $pb.ProtobufEnum {
  static const Command nearby = Command._(0, 'nearby');
  static const Command within = Command._(1, 'within');
  static const Command intersects = Command._(2, 'intersects');

  static const $core.List<Command> values = <Command> [
    nearby,
    within,
    intersects,
  ];

  static final $core.Map<$core.int, Command> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Command valueOf($core.int value) => _byValue[value];

  const Command._($core.int v, $core.String n) : super(v, n);
}

