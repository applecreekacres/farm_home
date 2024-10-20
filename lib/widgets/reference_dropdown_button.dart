import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

class ReferenceDropDownButton<T extends Reference> extends StatefulWidget {
  final String label;
  final List<T> items;
  final ValueChanged<String?>? onChanged;

  const ReferenceDropDownButton(
      {super.key, required this.label, required this.items, this.onChanged});

  @override
  State<ReferenceDropDownButton<T>> createState() =>
      _ReferenceDropDownButtonState<T>();
}

class _ReferenceDropDownButtonState<T extends Reference>
    extends State<ReferenceDropDownButton<T>> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),
        DropdownButton<int>(
          items: widget.items.map((value) {
            return DropdownMenuItem(
              value: widget.items
                  .indexWhere((item) => item.name == value.name),
              child: Text(value.name),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedIndex = value;
              });
            }
            widget.onChanged?.call(widget.items[_selectedIndex].id);
          },
          value: _selectedIndex,
        )
      ],
    );
  }
}
