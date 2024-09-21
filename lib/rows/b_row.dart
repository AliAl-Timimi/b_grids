import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/helpers/render_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BRow<T> extends StatelessWidget {
  const BRow({
    super.key,
    required this.item,
    required this.config,
    required this.stateManager,
    required this.index,
  });

  final BGridStateManager<T> stateManager;
  final T? item;
  final BGridConfig config;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: stateManager.isSelected(item)
            ? config.styling.selectedRowDecoration.copyWith(
                color: config.styling.selectedRowDecoration.color!
                    .withOpacity(0.5))
            : config.styling.rowDecoration.copyWith(
                color: config.styling.alternatingRowColors[
                    index % config.styling.alternatingRowColors.length]),
        child: Row(
          children: stateManager.columns.map((column) {
            final value = item != null
                ? stateManager.itemToRow.call(item!)[column.field]
                : column.defaultValue;
            final cellDecoration = column.cellDecorationBuilder?.call(value);
            return Expanded(
              child: DecoratedBox(
                decoration: cellDecoration?.copyWith(
                      color: stateManager.isSelected(item)
                          ? cellDecoration.color?.withOpacity(0.7)
                          : cellDecoration.color,
                    ) ??
                    BoxDecoration(),
                child: column.renderer(RenderContext(
                  item: item,
                  value: value,
                  index: index,
                  isSelected: stateManager.isSelected(item),
                  stateManager: stateManager,
                  column: column,
                )),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
