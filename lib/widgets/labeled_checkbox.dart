import 'package:flutter/material.dart';

class LabelledCheckbox extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const LabelledCheckbox({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  @override
  State<LabelledCheckbox> createState() => _LabelledCheckboxState();
}

class _LabelledCheckboxState extends State<LabelledCheckbox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;

              widget.onChanged?.call(value);
            });
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
