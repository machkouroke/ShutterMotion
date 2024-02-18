// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [fifteen_item_widget] screen.
class FifteenItemModel extends Equatable {
  FifteenItemModel({
    this.kmh,
    this.isSelected,
  }) {
    kmh = kmh ?? "km/h";
    isSelected = isSelected ?? false;
  }

  String? kmh;

  bool? isSelected;

  FifteenItemModel copyWith({
    String? kmh,
    bool? isSelected,
  }) {
    return FifteenItemModel(
      kmh: kmh ?? this.kmh,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [kmh, isSelected];
}
