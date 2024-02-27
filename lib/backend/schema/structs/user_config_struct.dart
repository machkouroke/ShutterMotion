// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserConfigStruct extends BaseStruct {
  UserConfigStruct({
    TempUnit? tempUnit,
    WindUnit? windUnit,
  })  : _tempUnit = tempUnit,
        _windUnit = windUnit;

  // "TempUnit" field.
  TempUnit? _tempUnit;
  TempUnit get tempUnit => _tempUnit ?? TempUnit.C;
  set tempUnit(TempUnit? val) => _tempUnit = val;
  bool hasTempUnit() => _tempUnit != null;

  // "WindUnit" field.
  WindUnit? _windUnit;
  WindUnit get windUnit => _windUnit ?? WindUnit.kmh;
  set windUnit(WindUnit? val) => _windUnit = val;
  bool hasWindUnit() => _windUnit != null;

  static UserConfigStruct fromMap(Map<String, dynamic> data) =>
      UserConfigStruct(
        tempUnit: deserializeEnum<TempUnit>(data['TempUnit']),
        windUnit: deserializeEnum<WindUnit>(data['WindUnit']),
      );

  static UserConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? UserConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'TempUnit': _tempUnit?.serialize(),
        'WindUnit': _windUnit?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'TempUnit': serializeParam(
          _tempUnit,
          ParamType.Enum,
        ),
        'WindUnit': serializeParam(
          _windUnit,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static UserConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserConfigStruct(
        tempUnit: deserializeParam<TempUnit>(
          data['TempUnit'],
          ParamType.Enum,
          false,
        ),
        windUnit: deserializeParam<WindUnit>(
          data['WindUnit'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'UserConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserConfigStruct &&
        tempUnit == other.tempUnit &&
        windUnit == other.windUnit;
  }

  @override
  int get hashCode => const ListEquality().hash([tempUnit, windUnit]);
}

UserConfigStruct createUserConfigStruct({
  TempUnit? tempUnit,
  WindUnit? windUnit,
}) =>
    UserConfigStruct(
      tempUnit: tempUnit,
      windUnit: windUnit,
    );
