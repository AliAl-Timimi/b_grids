import 'package:b_grids/helpers/render_context.dart';
import 'package:flutter/material.dart';

abstract class BFilter {
  const BFilter({
    required this.field,
    required this.renderer,
    required this.defaultValue,
  });

  final Widget Function(RenderContext context) renderer;
  final String field;
  final dynamic defaultValue;
}