// ignore_for_file: must_be_immutable

part of 'welcome_sign_up_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///WelcomeSignUp widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class WelcomeSignUpEvent extends Equatable {}

/// Event that is dispatched when the WelcomeSignUp widget is first created.
class WelcomeSignUpInitialEvent extends WelcomeSignUpEvent {
  @override
  List<Object?> get props => [];
}
