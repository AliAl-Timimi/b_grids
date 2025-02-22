import 'package:b_grids/helpers/render_context.dart';
import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

Widget defaultDateRenderer(RenderContext renderContext) {
  return Padding(
    padding: renderContext.column.contentPadding,
    child: Text(
      renderContext.value != null
          ? DateFormat().format(renderContext.value as DateTime)
          : '',
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

Widget defaultDateTimeRenderer(RenderContext renderContext) {
  return Padding(
    padding: renderContext.column.contentPadding,
    child: Text(
      renderContext.value != null
          ? DateFormat().format(renderContext.value as DateTime)
          : '',
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

Widget defaultBoolRenderer(RenderContext renderContext) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: renderContext.value as bool
        ? const Icon(
            Icons.check,
            color: Colors.greenAccent,
          )
        : const Icon(
            Icons.close,
            color: Colors.redAccent,
          ),
  );
}
