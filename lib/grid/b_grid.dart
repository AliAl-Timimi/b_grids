import 'package:b_grids/columns/b_column.dart';
import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/rows/b_row.dart';
import 'package:flutter/material.dart';

class BGrid<T> extends StatefulWidget {
  const BGrid({
    super.key,
    required this.itemToRow,
    required this.columns,
    required this.items,
    this.config = const BGridConfig(),
    this.onSelect,
    this.multiSelect = false,
  });

  final Map<String, dynamic Function(T item)> itemToRow;
  final List<BColumn> columns;
  final List<T> items;
  final BGridConfig config;
  final void Function(T item)? onSelect;
  final bool multiSelect;

  @override
  State<BGrid<T>> createState() => _BGridState<T>();
}

class _BGridState<T> extends State<BGrid<T>> {
  final List<T> selectedItems = [];

  void toggleSelection(T item) async {
    if (!widget.multiSelect &&
        selectedItems.isNotEmpty &&
        !selectedItems.contains(item)) {
      selectedItems.clear();
    }
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
      widget.onSelect?.call(item);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: widget.config.styling.gridDecoration,
      child: Material(
        child: Column(
          children: [
            DecoratedBox(
              decoration: widget.config.styling.headerDecoration,
              child: Row(
                children: widget.columns
                    .map(
                      (column) => Expanded(
                        child: Padding(
                          padding: widget.config.styling.headerPadding,
                          child: column.headerRenderer.call(column.field),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Flexible(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                prototypeItem: BRow<T?>(
                  columns: widget.columns,
                  config: widget.config,
                  item: widget.items.isNotEmpty ? widget.items.first : null,
                  itemToRow: <String, dynamic Function(T? item)>{},
                ),
                itemCount: widget.items.length,
                itemBuilder: (context, index) => InkWell(
                  hoverColor: widget.config.styling.hoverColor,
                  onTap: () => toggleSelection(widget.items[index]),
                  splashColor: widget.config.styling.splashColor,
                  child: BRow<T>(
                    columns: widget.columns,
                    config: widget.config,
                    item: widget.items[index],
                    itemToRow: widget.itemToRow,
                    selected: selectedItems.contains(widget.items[index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
