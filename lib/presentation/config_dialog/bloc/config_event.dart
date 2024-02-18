// ignore_for_file: must_be_immutable

part of 'config_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Config widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ConfigEvent extends Equatable {}

/// Event that is dispatched when the Config widget is first created.
class ConfigInitialEvent extends ConfigEvent {
  @override
  List<Object?> get props => [];
}
