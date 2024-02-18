// ignore_for_file: must_be_immutable

part of 'config_bloc.dart';

/// Represents the state of Config in the application.
class ConfigState extends Equatable {
  ConfigState({this.configModelObj});

  ConfigModel? configModelObj;

  @override
  List<Object?> get props => [
        configModelObj,
      ];
  ConfigState copyWith({ConfigModel? configModelObj}) {
    return ConfigState(
      configModelObj: configModelObj ?? this.configModelObj,
    );
  }
}
