import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';

Widget defaultTextRenderer(dynamic value) {
  return Text(
    value.toString(),
    style: TextStyle(
      color: rowTextColor,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    ),
  );
}

Widget defaultNumberRenderer(dynamic value) {
  return Text(
    value.toString(),
    textAlign: TextAlign.right,
    style: TextStyle(
      color: rowTextColor,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    ),
  );
}
