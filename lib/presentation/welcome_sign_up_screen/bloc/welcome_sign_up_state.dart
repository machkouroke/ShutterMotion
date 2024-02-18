// ignore_for_file: must_be_immutable

part of 'welcome_sign_up_bloc.dart';

/// Represents the state of WelcomeSignUp in the application.
class WelcomeSignUpState extends Equatable {
  WelcomeSignUpState({this.welcomeSignUpModelObj});

  WelcomeSignUpModel? welcomeSignUpModelObj;

  @override
  List<Object?> get props => [
        welcomeSignUpModelObj,
      ];
  WelcomeSignUpState copyWith({WelcomeSignUpModel? welcomeSignUpModelObj}) {
    return WelcomeSignUpState(
      welcomeSignUpModelObj:
          welcomeSignUpModelObj ?? this.welcomeSignUpModelObj,
    );
  }
}
