import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ReferenceDropDownButton<T extends Reference> extends StatefulWidget {
  final String label;
  final T? initialValue;
  final List<T> items;
  final ValueChanged<dynamic>? onChanged;

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
  @override
  Widget build(BuildContext context) {
    widget.items.sort((a, b) => a.name.compareTo(b.name));
    return LabeledDropdownButton(
      initialValue: widget.initialValue,
      label: widget.label,
      items: widget.items,
      itemView: (value) => Text((value as Reference).name),
      onChanged: widget.onChanged,
    );
  }
}
