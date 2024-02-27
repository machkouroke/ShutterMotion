// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShutterStruct extends BaseStruct {
  ShutterStruct({
    ShutterState? state,
  }) : _state = state;

  // "State" field.
  ShutterState? _state;
  ShutterState get state => _state ?? ShutterState.Closed;
  set state(ShutterState? val) => _state = val;
  bool hasState() => _state != null;

  static ShutterStruct fromMap(Map<String, dynamic> data) => ShutterStruct(
        state: deserializeEnum<ShutterState>(data['State']),
      );

  static ShutterStruct? maybeFromMap(dynamic data) =>
      data is Map ? ShutterStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'State': _state?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'State': serializeParam(
          _state,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static ShutterStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShutterStruct(
        state: deserializeParam<ShutterState>(
          data['State'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'ShutterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShutterStruct && state == other.state;
  }

  @override
  int get hashCode => const ListEquality().hash([state]);
}

ShutterStruct createShutterStruct({
  ShutterState? state,
}) =>
    ShutterStruct(
      state: state,
    );
