
import 'package:b_grids/b_grids.dart';
import 'package:b_grids/columns/column_type.dart';
import 'package:b_grids/theming/cell_renderers.dart';
import 'package:b_grids/theming/column_renderers.dart';

class BDateColumn extends BColumn {
  BDateColumn({
    super.renderer = defaultDateRenderer,
    required super.field,
    super.headerRenderer = defaultHeaderRenderer,
    super.contentPadding,
    super.defaultValue,
    super.cellDecorationBuilder,
    super.cellTextStyleBuilder,
    super.filter,
  }) : super(
          type: ColumnType.DATETIME,
        );
}