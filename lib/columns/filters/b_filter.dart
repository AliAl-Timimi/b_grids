import 'package:b_grids/input/b_input_decoration.dart';

class BFilter {
  BFilter({
    this.enabled = true,
    this.inputDecoration = const BInputDecoration(),
    this.initialValue,
    this.filterFunction,
  });

  final bool enabled;
  final BInputDecoration inputDecoration;
  final dynamic initialValue;
  final bool Function(dynamic value)? filterFunction;
}
