import 'package:flutter/material.dart';

class LabeledDropdownButton<T> extends StatefulWidget {
  final String label;
  final T? initialValue;
  final List<T> items;
  final ValueChanged<dynamic>? onChanged;
  final String Function(dynamic) itemView;

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

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: DropdownMenu(
        expandedInsets: EdgeInsets.zero,
        label: Text(widget.label),
        controller: controller,
        initialSelection: widget.initialValue,
        dropdownMenuEntries: widget.items.map((item) {
          return DropdownMenuEntry(value: item, label: widget.itemView(item));
        }).toList(),
        onSelected: (value) {
          widget.onChanged?.call(value);
        },
      ),
    );
  }
}
