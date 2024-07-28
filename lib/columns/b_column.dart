import 'package:b_grids/columns/column_type.dart';
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
    this.cellDecoration,
  });

  final Widget Function(dynamic value) renderer;
  final BoxDecoration? cellDecoration;
  final ColumnType type;
  final String field;
  final Widget Function(String field) headerRenderer;
  final Alignment alignment;
  final EdgeInsets contentPadding;
  final dynamic defaultValue;
}
