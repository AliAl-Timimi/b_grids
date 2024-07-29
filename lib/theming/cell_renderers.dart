import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';

Widget defaultTextRenderer(dynamic value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      value.toString(),
      style: TextStyle(
        color: rowTextColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
    ),
  );
}

BoxDecoration defaultCellDecorationBuilder(dynamic value) {
  return BoxDecoration(
    color: Colors.white,
  );
}

Widget defaultNumberRenderer(dynamic value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      value.toString(),
      textAlign: TextAlign.right,
      style: TextStyle(
        color: rowTextColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
    ),
  );
}
