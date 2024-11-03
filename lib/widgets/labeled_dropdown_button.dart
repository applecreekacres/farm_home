import 'package:flutter/material.dart';

class LabeledDropdownButton<T> extends StatefulWidget {
  final String label;
  final T? initialValue;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final Widget Function(dynamic) itemView;

  const LabeledDropdownButton({
    super.key,
    required this.initialValue,
    required this.label,
    required this.items,
    required this.itemView,
    this.onChanged,
  });

  @override
  State<LabeledDropdownButton> createState() =>
      _LabeledDropdownButtonState<T>();
}

class _LabeledDropdownButtonState<T> extends State<LabeledDropdownButton> {
  late T _selectedItem;

  @override
  void initState() {
    if (widget.initialValue != null) {
      _selectedItem = widget.initialValue;
    } else {
      _selectedItem = widget.items.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(6),
          child: Text(widget.label),
        ),
        DropdownButton<T>(
          hint: const Text("Select Item"),
          items: widget.items.map((value) {
            return DropdownMenuItem<T>(
              value: value,
              child: widget.itemView(value),
            );
          }).toList(),
          onChanged: (value) {
            widget.onChanged?.call(value);
            if (value != null) {
              setState(() {
                _selectedItem = value;
              });
            }
          },
          value: _selectedItem,
        )
      ],
    );
  }
}
