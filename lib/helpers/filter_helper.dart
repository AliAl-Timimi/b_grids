import 'package:b_grids/columns/column_type.dart';
import 'package:b_grids/columns/filters/b_filter.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/input/b_dropdown.dart';
import 'package:b_grids/input/b_number_field.dart';
import 'package:b_grids/input/b_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin filterHelper<T> {
  final RxMap<String, Widget> filterWidgets = <String, Widget>{}.obs;
  final RxMap<String, dynamic> filterValues = <String, dynamic>{}.obs;

  void createFiltersFromStateManager(BGridStateManager<T> stateManager) {
    stateManager.columns.forEach((column) {
      switch (column.type) {
        case ColumnType.TEXT:
          _createTextFilter(stateManager, column.field, column.filter);
          break;
        case ColumnType.NUMBER:
          _createNumberFilter(stateManager, column.field, column.filter);
        case ColumnType.BOOL:
          _createBooleanFilter(stateManager, column.field, column.filter);
        case ColumnType.DATETIME:
        // TODO: Handle this case.
        case ColumnType.DATE:
        // TODO: Handle this case.
        case ColumnType.TIME:
        // TODO: Handle this case.
        case ColumnType.ICON:
        // TODO: Handle this case.
      }
    });
  }

  void _filterColumn(
      BGridStateManager<T> stateManager, String field, dynamic value) {
    filterValues[field] = value;
    _updateFilters(stateManager);
  }

  Future<void> _updateFilters(BGridStateManager<T> stateManager) async {
    List<T> _tempList = stateManager.originalList;
    filterValues.forEach((key, value) {
      if (value == null) return;
      _tempList = _tempList.where((item) {
        final row = stateManager.itemToRow(item);
        return row[key]
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase());
      }).toList();
    });
    stateManager.filteredList.clear();
    stateManager.filteredList.addAll(_tempList);
  }

  void _createTextFilter(
    BGridStateManager<T> stateManager,
    String field,
    BFilter? filter,
  ) {
    filterWidgets[field] = BTextField(
      onChanged: (value) => _filterColumn(stateManager, field, value),
    );
  }

  void _createNumberFilter(
      BGridStateManager<T> stateManager, String field, BFilter? filter) {
    filterWidgets[field] = BNumberField(
      onChanged: (value) => _filterColumn(stateManager, field, value),
    );
  }

  void _createBooleanFilter(
      BGridStateManager<T> stateManager, String field, BFilter? filter) {
    filterWidgets[field] = BDropDown(
      onChanged: (value) => _filterColumn(stateManager, field, value),
      items: {
        null: const SizedBox.shrink(),
        true: const Center(
          child: Icon(
            Icons.check,
            color: Colors.greenAccent,
          ),
        ),
        false: const Center(
          child: Icon(
            Icons.close,
            color: Colors.redAccent,
          ),
        ),
      },
    );
  }
}
