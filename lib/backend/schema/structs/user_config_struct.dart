// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserConfigStruct extends BaseStruct {
  UserConfigStruct({
    TempUnit? tempUnit,
    WindUnit? windUnit,
    String? selectedShutter,
  })  : _tempUnit = tempUnit,
        _windUnit = windUnit,
        _selectedShutter = selectedShutter;

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

  // "SelectedShutter" field.
  String? _selectedShutter;
  String get selectedShutter => _selectedShutter ?? '';
  set selectedShutter(String? val) => _selectedShutter = val;
  bool hasSelectedShutter() => _selectedShutter != null;

  static UserConfigStruct fromMap(Map<String, dynamic> data) =>
      UserConfigStruct(
        tempUnit: deserializeEnum<TempUnit>(data['TempUnit']),
        windUnit: deserializeEnum<WindUnit>(data['WindUnit']),
        selectedShutter: data['SelectedShutter'] as String?,
      );

  static UserConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? UserConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'TempUnit': _tempUnit?.serialize(),
        'WindUnit': _windUnit?.serialize(),
        'SelectedShutter': _selectedShutter,
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
        'SelectedShutter': serializeParam(
          _selectedShutter,
          ParamType.String,
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
        selectedShutter: deserializeParam(
          data['SelectedShutter'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserConfigStruct &&
        tempUnit == other.tempUnit &&
        windUnit == other.windUnit &&
        selectedShutter == other.selectedShutter;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tempUnit, windUnit, selectedShutter]);
}

UserConfigStruct createUserConfigStruct({
  TempUnit? tempUnit,
  WindUnit? windUnit,
  String? selectedShutter,
}) =>
    UserConfigStruct(
      tempUnit: tempUnit,
      windUnit: windUnit,
      selectedShutter: selectedShutter,
    );
