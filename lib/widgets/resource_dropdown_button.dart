import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

class ResourceDropDownButton<T extends Resource> extends StatefulWidget {
  final String label;
  final List<T> items;
  final ValueChanged<T?>? onChanged;

  const ResourceDropDownButton(
      {super.key, required this.label, required this.items, this.onChanged});

  @override
  State<ResourceDropDownButton<T>> createState() =>
      _ResourceDropDownButtonState<T>();
}

class _ResourceDropDownButtonState<T extends Resource>
    extends State<ResourceDropDownButton<T>> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),
        DropdownButton<T>(
          items: widget.items.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedIndex = widget.items.indexWhere((item) => item.name == value.name);
              });
            }
            widget.onChanged?.call(value);
          },
          value: widget.items[_selectedIndex],
        )
      ],
    );
  }
}
