import 'package:b_grids/b_grids.dart';
import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:flutter/material.dart';

class BRow<T> extends StatelessWidget {
  const BRow({
    super.key,
    required this.columns,
    required this.item,
    required this.itemToRow,
    required this.config,
    this.selected = false,
  });

  final List<BColumn> columns;
  final Map<String, dynamic Function(T item)> itemToRow;
  final T item;
  final BGridConfig config;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: selected
          ? config.styling.selectedRowDecoration
          : config.styling.rowDecoration,
      child: Row(
        children: columns.map((column) {
          final value =
              itemToRow[column.field]?.call(item) ?? column.defaultValue;
          return Expanded(
            child: DecoratedBox(
              decoration: column.cellDecoration ?? BoxDecoration(),
              child: Padding(
                padding: column.contentPadding,
                child: column.renderer(value),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
