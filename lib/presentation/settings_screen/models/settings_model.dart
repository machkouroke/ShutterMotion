// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'eighteen_item_model.dart';
import 'fifteen_item_model.dart';

/// This class defines the variables used in the [settings_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SettingsModel extends Equatable {
  SettingsModel({
    this.eighteenItemList = const [],
    this.fifteenItemList = const [],
  }) {}

  List<EighteenItemModel> eighteenItemList;

  List<FifteenItemModel> fifteenItemList;

  SettingsModel copyWith({
    List<EighteenItemModel>? eighteenItemList,
    List<FifteenItemModel>? fifteenItemList,
  }) {
    return SettingsModel(
      eighteenItemList: eighteenItemList ?? this.eighteenItemList,
      fifteenItemList: fifteenItemList ?? this.fifteenItemList,
    );
  }

  @override
  List<Object?> get props => [eighteenItemList, fifteenItemList];
}
