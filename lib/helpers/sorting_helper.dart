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
          final dynamic valueA = stateManager.itemToRow.call(a)[field];
          final dynamic valueB = stateManager.itemToRow.call(b)[field];
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
        final dynamic valueA = stateManager.itemToRow.call(a)[field];
        final dynamic valueB = stateManager.itemToRow.call(b)[field];
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

// import 'package:b_grids/configuration/b_grid_state_manager.dart';
// import 'package:b_grids/enums/sort_direction.dart';
// import 'package:get/get.dart';
//
// mixin SortingHelper<T> {
//   RxMap<String, SortDirection> sortDirections = <String, SortDirection>{}.obs;
//
//   Future<void> _applySorting(
//     BGridStateManager<T> stateManager,
//   ) async {
//     stateManager.filteredList.clear();
//     stateManager.filteredList
//         .addAll(_startQuickSort(stateManager, stateManager.originalList));
//   }
//
//   // List<T> _quickSort(BGridStateManager<T> stateManager, List<T> list) {
//   //   if (list.length <= 1) {
//   //     return list;
//   //   }
//   //   T pivot = list[0];
//   //   List<T> less = [];
//   //   List<T> greater = [];
//   //   for (int i = 1; i < list.length; i++) {
//   //     if (_compare(stateManager, list[i], pivot)) {
//   //       less.add(list[i]);
//   //     } else {
//   //       greater.add(list[i]);
//   //     }
//   //   }
//   //   return [
//   //     ..._quickSort(stateManager, less),
//   //     pivot,
//   //     ..._quickSort(stateManager, greater)
//   //   ];
//   // }
//
//   // List<int> quickSort(List<T> list, T low, T high) {
//   //   if (lowhigh) {
//   //     int pi = partition(list, low, high);
//   //     print("pivot: ${list[pi]} now at index $pi");
//   //
//   //     quickSort(list, low, pi - 1);
//   //     quickSort(list, pi + 1, high);
//   //   }
//   //   return list;
//   // }
//
//   List<T> _startQuickSort(BGridStateManager<T> stateManager, List<T> list) {
//     final low = 0;
//     final high = list.length - 1;
//     return _quickSort(stateManager, list, low: low, high: high);
//   }
//
//   List<T> _quickSort(BGridStateManager<T> stateManager, List<T> list,
//       {int low = 0, int high = -1}) {
//     if (low > high) {
//       return list;
//     }
//     final int pivot = partition(stateManager, list, 0, list.length - 1);
//     final List<T> left = list.sublist(0, pivot);
//     final List<T> right = list.sublist(pivot + 1);
//     return [
//       ..._quickSort(stateManager, left, low: low, high: pivot - 1),
//       list[pivot],
//       ..._quickSort(stateManager, right, low: pivot + 1, high: high)
//     ];
//   }
//
//   int partition(
//       BGridStateManager<T> stateManager, List<T> list, int low, int high) {
//     // Base check
//     if (list.isEmpty) {
//       return 0;
//     }
//     // Take our last element as pivot and counter i one less than low
//     T pivot = list[high];
//
//     int i = low - 1;
//     for (int j = low; j < high; j++) {
//       // When j is < than pivot element we increment i and swap arr[i] and arr[j]
//       if (_compare(stateManager, list[j], pivot)) {
//         i++;
//         swap(list, i, j);
//       }
//     }
//     // Swap the last element and place in front of the i'th element
//     swap(list, i + 1, high);
//     return i + 1;
//   }
//
// // Swapping using a temp variable
//   void swap(List<T> list, int i, int j) {
//     T temp = list[i];
//     list[i] = list[j];
//     list[j] = temp;
//   }
//
//   bool _compare(BGridStateManager<T> stateManager, T a, T b) {
//     for (final field in sortDirections.keys) {
//       final result = stateManager.itemToRow
//           .call(a)[field]!
//           .toString()
//           .compareTo(stateManager.itemToRow.call(b)[field]!.toString());
//       if (result != 0) {
//         return sortDirections[field]!.isAsc ? result < 0 : result > 0;
//       }
//     }
//     return false;
//   }
//
//   void setSortDirection(String field, SortDirection? direction) {
//     if (direction == null) {
//       sortDirections.remove(field);
//       return;
//     }
//     sortDirections[field] = direction;
//     _applySorting(this as BGridStateManager<T>);
//   }
//
//   int getSortOrder(String field) => sortDirections.keys.toList().indexOf(field);
//
//   SortDirection? getSortDirection(String field) => sortDirections[field];
//
//   void clearSorting() {
//     sortDirections.clear();
//   }
// }
