import 'package:b_grids/columns/column_type.dart';
import 'package:b_grids/configuration/b_grid_config.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/helpers/render_context.dart';
import 'package:flutter/cupertino.dart';

abstract class BColumn {
  const BColumn({
    required this.field,
    required this.type,
    required this.renderer,
    required this.headerRenderer,
    this.alignment = Alignment.center,
    this.contentPadding = const EdgeInsets.all(8),
    required this.defaultValue,
    this.cellDecorationBuilder,
    this.cellTextStyleBuilder,
  });

  final Widget Function(RenderContext context) renderer;
  final ColumnType type;
  final String field;
  final Widget Function(
    String field,
    BGridStateManager<dynamic> stateManager,
    BGridConfig config,
  ) headerRenderer;
  final Alignment alignment;
  final EdgeInsets contentPadding;
  final dynamic defaultValue;
  final BoxDecoration Function(dynamic value)? cellDecorationBuilder;
  final TextStyle Function(dynamic value)? cellTextStyleBuilder;
}
