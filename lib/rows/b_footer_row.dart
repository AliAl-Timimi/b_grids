import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/helpers/render_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BFooterRow<T> extends StatelessWidget {
  const BFooterRow({
    super.key,
    required this.config,
    required this.stateManager,
  });

  final BGridStateManager<T> stateManager;
  final BGridConfig config;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: stateManager.columns.map((column) {
          return Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(),
              child: column.footerRenderer?.call(stateManager, column.field) ??
                  SizedBox.shrink(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
