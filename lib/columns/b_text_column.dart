import 'package:b_grids/columns/b_column.dart';
import 'package:b_grids/columns/column_type.dart';
import 'package:b_grids/theming/cell_renderers.dart';
import 'package:b_grids/theming/column_renderers.dart';

class BTextColumn extends BColumn {
  BTextColumn({
    super.renderer = defaultTextRenderer,
    required super.field,
    super.headerRenderer = defaultHeaderRenderer,
    super.contentPadding,
    super.defaultValue,
    super.cellDecorationBuilder,
    super.cellTextStyleBuilder,
    super.filter,
  }) : super(
          type: ColumnType.TEXT,
        );
}
