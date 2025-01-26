import 'dart:async';

import 'package:b_grids/columns/b_column.dart';
import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/enums/sort_direction.dart';
import 'package:b_grids/helpers/filter_helper.dart';
import 'package:b_grids/helpers/selection_helper.dart';
import 'package:b_grids/helpers/sorting_helper.dart';
import 'package:get/get.dart';

class BGridStateManager<T>
    with SelectionHelper<T>, SortingHelper<T>, filterHelper<T> {
  final Map<String, dynamic> Function(T item) itemToRow;
  final List<BColumn> columns;
  FutureOr<List<T>> Function() valueProvider;

  BGridStateManager({
    required this.itemToRow,
    required this.columns,
    required this.valueProvider,
  });

  final RxList<T> originalList = <T>[].obs;
  final RxList<T> refItems = <T>[].obs;

  List<T> get items => [...originalList];

  Future<void> initGridStateManager(
      BGridConfig config, void Function(T item)? onSelect) async {
    _loadItems();
    createFiltersFromStateManager(this);
    setMultiSelect = config.multiSelect;
    setOnSelect(onSelect);
  }

  void _loadItems() async {
    originalList.clear();
    originalList.addAll(await valueProvider());
    refItems.addAll(originalList);
  }

  void setOnSelect(void Function(T item)? onSelect) {
    this.onSelect = onSelect;
  }

  void toggleColumnSort(String field, {bool clearOthers = true}) {
    if (clearOthers &&
        (sortDirections.length > 1 ||
            (sortDirections.length == 1 &&
                !sortDirections.containsKey(field)))) {
      clearSorting();
    }
    setSortDirection(
        field,
        sortDirections[field] == SortDirection.ASC
            ? SortDirection.DESC
            : sortDirections[field] == SortDirection.DESC
                ? null
                : SortDirection.ASC);
  }
}
