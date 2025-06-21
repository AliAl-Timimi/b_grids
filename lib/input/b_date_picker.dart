import 'package:b_grids/input/b_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BDatePicker extends StatelessWidget {
  const BDatePicker({
    super.key,
    this.value,
    required this.onChanged,
    this.decoration = const BInputDecoration(),
    this.format,
  });

  final DateTime? value;
  final void Function(dynamic value) onChanged;
  final InputDecoration decoration;
  final String? format;
  //TODO date variables

  @override
  Widget build(BuildContext context) {
    Rx<DateTime?> _value = this.value.obs;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Obx(
        () => TextField(
          decoration: decoration.copyWith(
            suffixIcon: GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _value.value ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    _value.value = picked;
                    onChanged(picked);
                  }
                },
                child: Icon(
                  Icons.calendar_today,
                )),
          ),
          controller: TextEditingController(
            text: _value.value == null ? "" : DateFormat(format).format(_value.value!),
          ),
          onChanged: (text) {
            onChanged(DateTime.tryParse(text) ?? null);
          },
        ),
      ),
    );
  }
}
