import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntFormField extends StatefulWidget {
  final ValueChanged<int?>? onChanged;
  final String label;

  const IntFormField({super.key, required this.label, this.onChanged});

  @override
  State<IntFormField> createState() => _IntFormFieldState();
}

class _IntFormFieldState extends State<IntFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: widget.label),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      onChanged: (value) => widget.onChanged?.call(int.parse(value)),
    );
  }
}
