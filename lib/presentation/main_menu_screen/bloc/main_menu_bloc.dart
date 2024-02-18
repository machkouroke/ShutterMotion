import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:shutter_motion/presentation/main_menu_screen/models/main_menu_model.dart';
part 'main_menu_event.dart';
part 'main_menu_state.dart';

/// A bloc that manages the state of a MainMenu according to the event that is dispatched to it.
class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc(MainMenuState initialState) : super(initialState) {
    on<MainMenuInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MainMenuInitialEvent event,
    Emitter<MainMenuState> emit,
  ) async {}
}
