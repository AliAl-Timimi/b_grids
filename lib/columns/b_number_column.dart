import 'package:b_grids/columns/b_column.dart';
import 'package:b_grids/columns/column_type.dart';
import 'package:b_grids/columns/filters/b_number_filter.dart';
import 'package:b_grids/theming/cell_renderers.dart';
import 'package:b_grids/theming/column_renderers.dart';
import 'package:flutter/material.dart';

class BNumberColumn extends BColumn {
  BNumberColumn({
    super.renderer = defaultNumberRenderer,
    required super.field,
    super.headerRenderer = defaultHeaderRenderer,
    super.alignment = Alignment.centerRight,
    super.contentPadding,
    super.defaultValue = 0,
    super.cellDecorationBuilder,
    super.cellTextStyleBuilder,
    super.footerRenderer,
    this.filter,
  }) : super(
          type: ColumnType.NUMBER,
          filter: filter,
        );

  final BNumberFilter? filter;
}
