import 'package:b_grids/configuration/b_grid_state_manager.dart';
import 'package:b_grids/input/b_input_decoration.dart';
import 'package:flutter/material.dart';

class BTextField extends StatefulWidget {
  const BTextField({
    super.key,
    required this.stateManager,
    this.value,
    required this.field,
  });

  final BGridStateManager<dynamic> stateManager;
  final String? value;
  final String field;

  @override
  State<BTextField> createState() => _BTextFieldState();
}

class _BTextFieldState extends State<BTextField> {
  String _value = "";

  @override
  void initState() {
    super.initState();
    if (widget.value?.isNotEmpty ?? false) {
      _value = widget.value!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: BInputDecoration(),
      controller: TextEditingController(
        text: _value.toString(),
      ),
      onChanged: (text) {
        _value = text;
      },
    );
  }
}
