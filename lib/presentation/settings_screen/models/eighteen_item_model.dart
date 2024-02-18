// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [eighteen_item_widget] screen.
class EighteenItemModel extends Equatable {
  EighteenItemModel({
    this.celsius,
    this.isSelected,
  }) {
    celsius = celsius ?? "Celsius";
    isSelected = isSelected ?? false;
  }

  String? celsius;

  bool? isSelected;

  EighteenItemModel copyWith({
    String? celsius,
    bool? isSelected,
  }) {
    return EighteenItemModel(
      celsius: celsius ?? this.celsius,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [celsius, isSelected];
}
