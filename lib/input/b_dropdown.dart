import 'package:b_grids/input/b_input_decoration.dart';
import 'package:flutter/material.dart';

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
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DropdownButton(
          value: value,
          isDense: decoration.isDense ?? false,
          isExpanded: true,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          underline: const SizedBox.shrink(),
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
            onChanged(value);
          },
        ),
      ),
    );
  }
}
