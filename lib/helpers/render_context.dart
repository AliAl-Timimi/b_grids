import 'package:b_grids/columns/b_column.dart';
import 'package:b_grids/configuration/b_grid_state_manager.dart';

class RenderContext {
  final dynamic item;
  final dynamic value;
  final int index;
  final bool isSelected;
  final BGridStateManager<dynamic> stateManager;
  final BColumn column;

  RenderContext({
    required this.item,
    required this.value,
    required this.index,
    required this.isSelected,
    required this.stateManager,
    required this.column,
  });
}
