import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/rows/b_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BGrid<T> extends StatelessWidget {
  const BGrid({
    super.key,
    this.config = const BGridConfig(),
    this.onSelect,
    required this.stateManager,
  });

  final BGridStateManager<T> stateManager;
  final BGridConfig config;
  final void Function(T item)? onSelect;

  @override
  Widget build(BuildContext context) {
    stateManager.initGridStateManager(config, onSelect);

    return DecoratedBox(
      decoration: config.styling.gridDecoration,
      child: SizedBox.expand(
        child: Column(
          children: [
            DecoratedBox(
              decoration: config.styling.headerDecoration,
              child: Row(
                children: stateManager.columns
                    .map(
                      (column) => Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () => stateManager.toggleColumnSort(
                                  column.field,
                                  clearOthers: !HardwareKeyboard
                                      .instance.isShiftPressed),
                              onLongPress: () => stateManager.toggleColumnSort(
                                column.field,
                                clearOthers: true,
                              ),
                              child: Obx(
                                () => Padding(
                                  padding: config.styling.headerPadding,
                                  child: column.headerRenderer
                                      .call(column.field, stateManager, config),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: config.styling.filterPadding,
                                child:
                                    stateManager.filterWidgets[column.field] ??
                                        SizedBox.shrink(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Flexible(
              child: Obx(
                () => Material(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    prototypeItem: BRow<T>(
                      config: config,
                      item: stateManager.items.isNotEmpty
                          ? stateManager.items.first
                          : null,
                      stateManager: stateManager,
                      index: 0,
                    ),
                    itemCount: stateManager.refItems.length,
                    itemBuilder: (context, index) => InkWell(
                      hoverColor: config.styling.hoverColor,
                      onTap: () => stateManager.toggleSelection(
                          stateManager.refItems.elementAt(index)),
                      splashColor: config.styling.splashColor,
                      child: BRow<T>(
                        stateManager: stateManager,
                        config: config,
                        item: stateManager.refItems.elementAt(index),
                        index: index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
