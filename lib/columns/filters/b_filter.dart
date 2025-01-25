import 'package:b_grids/input/b_input_decoration.dart';

class BFilter {
  BFilter({
    this.inputDecoration = const BInputDecoration(),
    this.initialValue,
  });

  final BInputDecoration inputDecoration;
  final dynamic initialValue;
  // final bool Function(dynamic value)? filterFunction;
}
