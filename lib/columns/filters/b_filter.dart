import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:flutter/material.dart';

class BFilter<T> {
  BFilter({
    required this.field,
    required this.renderer,
    required this.defaultValue,
    required this.filter,
  });

  final Widget Function(BGridStateManager<dynamic> stateManager,T value) renderer;
  final String field;
  final T defaultValue;
  final bool Function(T value) filter;
  T? value;
}