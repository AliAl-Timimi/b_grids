import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';

Widget defaultHeaderRenderer(
  String field,
  BGridStateManager<dynamic> stateManager,
  BGridConfig config,
) {
  final sortDirection = stateManager.getSortDirection(field);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      stateManager.columns.where((element) => element.field == field,).firstOrNull?.headerText ??
      Text(
        field,
        style: TextStyle(
          color: headerTextColor,
          fontSize: headerFontSize,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
      ),
      if (sortDirection != null)
        DecoratedBox(
          decoration: BoxDecoration(
            color: sortDirection.isAsc
                ? config.styling.ascendingSortBackgroundColor
                : config.styling.descendingSortBackgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 4.5, bottom: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  sortDirection.isAsc
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: sortDirection.isAsc
                      ? config.styling.ascendingSortIconColor
                      : config.styling.descendingSortIconColor,
                  size: headerFontSize + 4,
                ),
                if (stateManager.getSortOrder(field) > 0)
                  Text(
                    stateManager.getSortOrder(field).toString(),
                    style: TextStyle(
                      color: sortDirection.isAsc
                          ? config.styling.ascendingSortTextColor
                          : config.styling.descendingSortTextColor,
                      fontSize: headerFontSize,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
              ],
            ),
          ),
        ),
    ],
  );
}
