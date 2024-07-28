import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';

Widget defaultHeaderRenderer(String field) {
  return Text(
    field,
    style: TextStyle(
      color: headerTextColor,
      fontSize: headerFontSize,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    ),
  );
}
