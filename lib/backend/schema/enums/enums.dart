import 'package:collection/collection.dart';

enum ShutterState {
  Closed,
  WhiteOpened,
  BlackOpened,
}

enum TempUnit {
  C,
  F,
}

enum WindUnit {
  kmh,
  ms,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ShutterState):
      return ShutterState.values.deserialize(value) as T?;
    case (TempUnit):
      return TempUnit.values.deserialize(value) as T?;
    case (WindUnit):
      return WindUnit.values.deserialize(value) as T?;
    default:
      return null;
  }
}
