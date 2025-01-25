import 'package:b_grids/input/b_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BNumberField extends StatefulWidget {
  const BNumberField({
    super.key,
    this.value,
    required this.onChanged,
  });

  final int? value;
  final void Function(dynamic value) onChanged;

  @override
  State<BNumberField> createState() => _BNumberFieldState();
}

class _BNumberFieldState extends State<BNumberField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: BInputDecoration(),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      controller: TextEditingController(
        text: widget.value?.toString() ?? "",
      ),
      onChanged: (text) {
        widget.onChanged(int.tryParse(text) ?? null);
      },
    );
  }
}
