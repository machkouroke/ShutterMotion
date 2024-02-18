import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:shutter_motion/presentation/welcome_sign_up_screen/models/welcome_sign_up_model.dart';
part 'welcome_sign_up_event.dart';
part 'welcome_sign_up_state.dart';

/// A bloc that manages the state of a WelcomeSignUp according to the event that is dispatched to it.
class WelcomeSignUpBloc extends Bloc<WelcomeSignUpEvent, WelcomeSignUpState> {
  WelcomeSignUpBloc(WelcomeSignUpState initialState) : super(initialState) {
    on<WelcomeSignUpInitialEvent>(_onInitialize);
  }

  _onInitialize(
    WelcomeSignUpInitialEvent event,
    Emitter<WelcomeSignUpState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.logInScreen,
      );
    });
  }
}
