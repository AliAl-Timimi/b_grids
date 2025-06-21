import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:flutter/material.dart';

class DefaultFooters {
  static Widget Function(BGridStateManager<dynamic> stateManager, String field)
      Sum({
    bool includePrefix = true,
    bool includeSuffix = true,
  }) {
    return (BGridStateManager<dynamic> stateManager, String field) {
      num sum = 0;
      /*
      for (final item in stateManager.refItems) {
        if (item == null) continue;
        Function test = stateManager.itemToRow;
        final value =  test.call(item as Object)[field];
        if (value is num) {
          sum += value;
        }
      }

       */
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "$sum",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    };
  }
}
