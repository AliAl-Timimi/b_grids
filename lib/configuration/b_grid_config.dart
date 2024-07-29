import 'package:b_grids/configuration/b_grid_styling.dart';

class BGridConfig {
  final bool multiSelect;

  final BGridStyling styling;

  const BGridConfig({
    this.styling = const BGridStyling(),
    this.multiSelect = false,
  });
}
