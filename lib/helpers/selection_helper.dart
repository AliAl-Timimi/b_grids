import 'package:get/get.dart';

mixin SelectionHelper<T> {
  final selectedItems = RxList<T>([]);
  void Function(T item)? onSelect;
  bool _multiSelect = false;

  bool isSelected(T? item) => selectedItems.contains(item);

  Future<bool> toggleSelection(T item) async {
    print("toggleSelection");
    if (!_multiSelect &&
        selectedItems.isNotEmpty &&
        !selectedItems.contains(item)) {
      selectedItems.clear();
    }
    if (selectedItems.contains(item)) {
      removeSelection(item);
      return false;
    } else {
      addSelection(item);
      onSelect?.call(item);
    }
    return true;
  }

  void set setMultiSelect(bool value) {
    _multiSelect = value;
  }

  void setOnSelect(void Function(T item)? onSelect) {
    this.onSelect = onSelect;
  }

  void clearSelection() {
    selectedItems.clear();
  }

  void setSelection(List<T> items) {
    selectedItems.clear();
    selectedItems.addAll(items);
  }

  void removeSelection(T item) {
    selectedItems.remove(item);
  }

  void addSelection(T item) {
    selectedItems.add(item);
  }
}
