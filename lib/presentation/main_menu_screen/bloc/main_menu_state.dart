// ignore_for_file: must_be_immutable

part of 'main_menu_bloc.dart';

/// Represents the state of MainMenu in the application.
class MainMenuState extends Equatable {
  MainMenuState({this.mainMenuModelObj});

  MainMenuModel? mainMenuModelObj;

  @override
  List<Object?> get props => [
        mainMenuModelObj,
      ];
  MainMenuState copyWith({MainMenuModel? mainMenuModelObj}) {
    return MainMenuState(
      mainMenuModelObj: mainMenuModelObj ?? this.mainMenuModelObj,
    );
  }
}
