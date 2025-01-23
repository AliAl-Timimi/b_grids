import 'package:b_grids/columns/filters/b_filter.dart';
import 'package:flutter/material.dart';

class BMultiFilter {
  BMultiFilter({
    required this.renderer,
  });

  final List<BFilter<dynamic>> filters = [];
  final Widget Function(List<BFilter<dynamic>> filters) renderer;
  final bool Function(List<BFilter<dynamic>> filters) filter = (filters) {
    return filters.any((filter) => filter.filter(filter.value));
  };

}