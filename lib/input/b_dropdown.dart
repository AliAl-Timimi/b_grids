import 'package:b_grids/input/b_input_decoration.dart';
import 'package:b_grids/theming/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BDropDown extends StatelessWidget {
  const BDropDown({
    super.key,
    this.value,
    required this.onChanged,
    required this.items,
    this.decoration = const BInputDecoration(),
  });

  final String? value;
  final void Function(dynamic value) onChanged;
  final Map<dynamic, Widget> items;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    Rx<String?> _value = value.obs;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: decoration.border?.borderSide.color ?? offGrey,
          width: decoration.border?.borderSide.width ?? 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Obx(
          () => DropdownButton(
            value: _value.value,
            isDense: decoration.isDense ?? false,
            isExpanded: true,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            underline: const SizedBox.shrink(),
            focusColor: decoration.focusColor,
            selectedItemBuilder: (BuildContext context) {
              return items.entries
                  .where((entry) => entry.key == value)
                  .map(
                    (entry) => entry.value,
                  )
                  .toList();
            },
            items: items.entries
                .map(
                  (entry) => DropdownMenuItem(
                    value: entry.key,
                    child: entry.value,
                  ),
                )
                .toList(),
            onChanged: (dynamic value) {
              _value.value = value as String?;
              onChanged(value);
            },
          ),
        ),
      ),
    );
  }
}
