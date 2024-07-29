import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';

class BGridStyling {
  final BoxDecoration gridDecoration;
  final EdgeInsets gridPadding;
  final EdgeInsets headerPadding;
  final BoxDecoration headerDecoration;
  final BoxDecoration rowDecoration;
  final BoxDecoration selectedRowDecoration;
  final List<Color> alternatingRowColors;
  final Color splashColor;
  final Color hoverColor;
  final Color descendingSortIconColor;
  final Color ascendingSortIconColor;
  final Color descendingSortTextColor;
  final Color ascendingSortTextColor;
  final Color descendingSortBackgroundColor;
  final Color ascendingSortBackgroundColor;

  const BGridStyling({
    this.gridDecoration = const BoxDecoration(
      border: Border(
        top: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        left: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        right: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        bottom: BorderSide(width: gridBorderWidth, color: gridBorderColor),
      ),
      color: gridBackgroundColor,
    ),
    this.gridPadding = gridInsets,
    this.headerPadding = headerInsets,
    this.headerDecoration = const BoxDecoration(
      color: headerBackgroundColor,
      border: Border(
        top: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        left: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        right: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        bottom: BorderSide(width: gridBorderWidth, color: gridBorderColor),
      ),
    ),
    this.rowDecoration = const BoxDecoration(
      color: rowBackgroundColor,
      border: Border(
        left: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        right: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        bottom: BorderSide(width: gridBorderWidth, color: gridBorderColor),
      ),
    ),
    this.selectedRowDecoration = const BoxDecoration(
      color: selectedRowBackgroundColor,
      border: Border(
        left: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        right: BorderSide(width: gridBorderWidth, color: gridBorderColor),
        bottom: BorderSide(width: gridBorderWidth, color: gridBorderColor),
      ),
    ),
    this.splashColor = selectedRowBackgroundColor,
    this.hoverColor = hoverRowBackgroundColor,
    this.alternatingRowColors = const [
      rowBackgroundColor,
      rowAlternateBackgroundColor
    ],
    this.descendingSortIconColor = Colors.redAccent,
    this.ascendingSortIconColor = Colors.greenAccent,
    this.descendingSortTextColor = Colors.black,
    this.ascendingSortTextColor = Colors.black,
    this.descendingSortBackgroundColor = Colors.black12,
    this.ascendingSortBackgroundColor = Colors.black12,
  });

  BGridStyling copyWith({
    BoxDecoration? gridDecoration,
    BoxDecoration? headerDecoration,
    BoxDecoration? rowDecoration,
    TextStyle? headerTextStyle,
    TextStyle? rowTextStyle,
  }) {
    return BGridStyling(
      gridDecoration: gridDecoration ?? this.gridDecoration,
      headerDecoration: headerDecoration ?? this.headerDecoration,
      rowDecoration: rowDecoration ?? this.rowDecoration,
    );
  }
}
