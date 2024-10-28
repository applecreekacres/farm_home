import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

class ReferenceDropDownButton<T extends Reference> extends StatefulWidget {
  final String label;
  final T? initialValue;
  final List<T> items;
  final ValueChanged<T?>? onChanged;

  const ReferenceDropDownButton(
      {super.key,
      required this.initialValue,
      required this.label,
      required this.items,
      this.onChanged});

  @override
  State<ReferenceDropDownButton<T>> createState() =>
      _ReferenceDropDownButtonState<T>();
}

class _ReferenceDropDownButtonState<T extends Reference>
    extends State<ReferenceDropDownButton<T>> {
  late int _selectedIndex;

  @override
  void initState() {
    if (widget.initialValue != null) {
      _selectedIndex =
          widget.items.indexWhere((val) => val.id == widget.initialValue!.id);
    } else {
      _selectedIndex = 0;
    }

    widget.items.sort((a, b) => a.name.compareTo(b.name));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),
        DropdownButton<T>(
          hint: const Text("Select Item"),
          items: widget.items.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedIndex =
                    widget.items.indexWhere((item) => item.name == value.name);
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
