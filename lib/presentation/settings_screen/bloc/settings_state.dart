// ignore_for_file: must_be_immutable

part of 'settings_bloc.dart';

/// Represents the state of Settings in the application.
class SettingsState extends Equatable {
  SettingsState({
    this.enteryourtemperatureController,
    this.settingsModelObj,
  });

  TextEditingController? enteryourtemperatureController;

  SettingsModel? settingsModelObj;

  @override
  List<Object?> get props => [
        enteryourtemperatureController,
        settingsModelObj,
      ];
  SettingsState copyWith({
    TextEditingController? enteryourtemperatureController,
    SettingsModel? settingsModelObj,
  }) {
    return SettingsState(
      enteryourtemperatureController:
          enteryourtemperatureController ?? this.enteryourtemperatureController,
      settingsModelObj: settingsModelObj ?? this.settingsModelObj,
    );
  }
}
