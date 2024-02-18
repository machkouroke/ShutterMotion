import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/eighteen_item_model.dart';
import '../models/fifteen_item_model.dart';
import 'package:shutter_motion/presentation/settings_screen/models/settings_model.dart';
part 'settings_event.dart';
part 'settings_state.dart';

/// A bloc that manages the state of a Settings according to the event that is dispatched to it.
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(SettingsState initialState) : super(initialState) {
    on<SettingsInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<UpdateChipView1Event>(_updateChipView1);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<SettingsState> emit,
  ) {
    List<EighteenItemModel> newList =
        List<EighteenItemModel>.from(state.settingsModelObj!.eighteenItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        settingsModelObj:
            state.settingsModelObj?.copyWith(eighteenItemList: newList)));
  }

  _updateChipView1(
    UpdateChipView1Event event,
    Emitter<SettingsState> emit,
  ) {
    List<FifteenItemModel> newList =
        List<FifteenItemModel>.from(state.settingsModelObj!.fifteenItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        settingsModelObj:
            state.settingsModelObj?.copyWith(fifteenItemList: newList)));
  }

  List<EighteenItemModel> fillEighteenItemList() {
    return List.generate(2, (index) => EighteenItemModel());
  }

  List<FifteenItemModel> fillFifteenItemList() {
    return List.generate(3, (index) => FifteenItemModel());
  }

  _onInitialize(
    SettingsInitialEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(
      enteryourtemperatureController: TextEditingController(),
    ));
    emit(state.copyWith(
        settingsModelObj: state.settingsModelObj?.copyWith(
      eighteenItemList: fillEighteenItemList(),
      fifteenItemList: fillFifteenItemList(),
    )));
  }
}
