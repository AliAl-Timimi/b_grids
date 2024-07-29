import 'package:b_grids/helpers/render_context.dart';
import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';

Widget defaultTextRenderer(RenderContext renderContext) {
  return Padding(
    padding: renderContext.column.contentPadding,
    child: Text(
      renderContext.value.toString(),
      style: TextStyle(
        color: rowTextColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      ),
    ),
  );
}

BoxDecoration defaultCellDecorationBuilder(RenderContext renderContext) {
  return BoxDecoration(
    color: Colors.white,
  );
}

Widget defaultNumberRenderer(RenderContext renderContext) {
  return Padding(
    padding: renderContext.column.contentPadding,
    child: Text(
      renderContext.value.toString(),
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
