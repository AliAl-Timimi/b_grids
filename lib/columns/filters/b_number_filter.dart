import 'package:b_grids/columns/filters/b_filter.dart';
import 'package:b_grids/columns/filters/b_filter_type.dart';


//TODO: CHECK WHY THIS IS NOT WORKING
class BNumberFilter extends BFilter {
  BNumberFilter({
    super.inputDecoration,
    super.initialValue,
    this.filterType = FilterType.EQUAL,
  }) : super();

  final FilterType filterType;
}
