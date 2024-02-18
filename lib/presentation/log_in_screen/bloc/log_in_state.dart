// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

/// Represents the state of LogIn in the application.
class LogInState extends Equatable {
  LogInState({this.logInModelObj});

  LogInModel? logInModelObj;

  @override
  List<Object?> get props => [
        logInModelObj,
      ];
  LogInState copyWith({LogInModel? logInModelObj}) {
    return LogInState(
      logInModelObj: logInModelObj ?? this.logInModelObj,
    );
  }
}
