import 'package:b_grids/b_grids.dart';
import 'package:b_grids/columns/column_type.dart';
import 'package:b_grids/columns/filters/b_filter.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/input/b_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin filterHelper<T> {
  final RxMap<String, Widget> filterWidgets = <String, Widget>{}.obs;

  void createFiltersFromStateManager(BGridStateManager<T> stateManager) {
    stateManager.columns.forEach((column) {
      switch (column.type) {
        case ColumnType.TEXT:
          _createTextFilter(stateManager, column.field, column.filter);
          break;
        case ColumnType.NUMBER:
          // TODO: Handle this case.
        case ColumnType.BOOLEAN:
          // TODO: Handle this case.
        case ColumnType.DATETIME:
          // TODO: Handle this case.
        case ColumnType.DATE:
          // TODO: Handle this case.
        case ColumnType.TIME:
          // TODO: Handle this case.
        case ColumnType.ICON:
          // TODO: Handle this case.
        case ColumnType.IMAGE:
          // TODO: Handle this case.
      }

    });
  }

  void _createTextFilter(
    BGridStateManager<T> stateManager,
    String field,
    BFilter? filter,
  ) {
    filterWidgets[field] = BTextField(
      stateManager: stateManager,
      field: field,
    );
  }
}
