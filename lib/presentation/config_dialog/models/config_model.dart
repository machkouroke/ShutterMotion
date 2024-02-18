// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [config_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class ConfigModel extends Equatable {
  ConfigModel() {}

  ConfigModel copyWith() {
    return ConfigModel();
  }

  @override
  List<Object?> get props => [];
}
