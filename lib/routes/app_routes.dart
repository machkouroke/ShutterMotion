import 'package:flutter/material.dart';
import 'package:shutter_motion/presentation/welcome_sign_up_screen/welcome_sign_up_screen.dart';
import 'package:shutter_motion/presentation/main_menu_screen/main_menu_screen.dart';
import 'package:shutter_motion/presentation/log_in_screen/log_in_screen.dart';
import 'package:shutter_motion/presentation/settings_screen/settings_screen.dart';
import 'package:shutter_motion/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String welcomeSignUpScreen = '/welcome_sign_up_screen';

  static const String mainMenuScreen = '/main_menu_screen';

  static const String logInScreen = '/log_in_screen';

  static const String settingsScreen = '/settings_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        welcomeSignUpScreen: WelcomeSignUpScreen.builder,
        mainMenuScreen: MainMenuScreen.builder,
        logInScreen: LogInScreen.builder,
        settingsScreen: SettingsScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: WelcomeSignUpScreen.builder
      };
}
