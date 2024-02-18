import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:shutter_motion/presentation/config_dialog/models/config_model.dart';
part 'config_event.dart';
part 'config_state.dart';

/// A bloc that manages the state of a Config according to the event that is dispatched to it.
class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc(ConfigState initialState) : super(initialState) {
    on<ConfigInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ConfigInitialEvent event,
    Emitter<ConfigState> emit,
  ) async {}
}
