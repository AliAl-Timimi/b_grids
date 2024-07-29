import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/enums/sort_direction.dart';
import 'package:get/get.dart';

mixin SortingHelper<T> {
  RxMap<String, SortDirection> sortDirections = <String, SortDirection>{}.obs;

  void _applySorting(BGridStateManager<T> stateManager,
      [bool newSortDirections = true, String field = '']) {
    print('Applying sorting ${sortDirections}');
    if (newSortDirections) {
      print('New sort directions');
    }
    stateManager.originalList.sort((a, b) {
      if (newSortDirections) {
        if (field.isNotEmpty) {
          final dynamic valueA = stateManager.itemToRow[field]?.call(a);
          final dynamic valueB = stateManager.itemToRow[field]?.call(b);
          final result = valueA.toString().compareTo(valueB.toString());
          if (result != 0) {
            return sortDirections[field] == SortDirection.ASC
                ? result
                : -result;
          }
          return 0;
        }
      }
      for (final field in sortDirections.keys) {
        final direction = sortDirections[field];
        final dynamic valueA = stateManager.itemToRow[field]?.call(a);
        final dynamic valueB = stateManager.itemToRow[field]?.call(b);
        final result = valueA.toString().compareTo(valueB.toString());
        if (result != 0) {
          return direction!.isAsc ? result : -result;
        }
      }
      return 0;
    });

    stateManager.filteredList.clear();
    stateManager.filteredList.addAll(stateManager.originalList);
  }

  void setSortDirection(String field, SortDirection? direction) {
    if (direction == null) {
      sortDirections.remove(field);
      return;
    }
    final newSortDirection = !sortDirections.containsKey(field);
    sortDirections[field] = direction;
    _applySorting(this as BGridStateManager<T>, newSortDirection);
  }

  int getSortOrder(String field) => sortDirections.keys.toList().indexOf(field);

  SortDirection? getSortDirection(String field) => sortDirections[field];

  void clearSorting() {
    sortDirections.clear();
  }
}
