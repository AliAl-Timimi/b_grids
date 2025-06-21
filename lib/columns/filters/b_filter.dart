import 'package:b_grids/input/b_input_decoration.dart';


//TODO CHANGE FILTER TYPE BASED ON VALUES
class BFilter {
  BFilter({
    this.inputDecoration = const BInputDecoration(),
    this.initialValue,
  });

  final BInputDecoration inputDecoration;
  final dynamic initialValue;
}
