// ignore_for_file: must_be_immutable

part of 'main_menu_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MainMenu widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MainMenuEvent extends Equatable {}

/// Event that is dispatched when the MainMenu widget is first created.
class MainMenuInitialEvent extends MainMenuEvent {
  @override
  List<Object?> get props => [];
}
