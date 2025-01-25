import 'package:b_grids/input/b_input_decoration.dart';
import 'package:flutter/material.dart';

class BTextField extends StatelessWidget {
  const BTextField({
    super.key,
    this.value,
    required this.onChanged,
  });

  final String? value;
  final void Function(dynamic value) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: BInputDecoration(),
      controller: TextEditingController(
        text: value?.toString() ?? "",
      ),
      onChanged: (text) {
        onChanged(text);
      },
    );
  }
}
