import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class ReferenceForm<T extends Reference> extends StatefulWidget {
  final T reference;
  final bool isNew;
  final List<Widget>? additionalFields;

  const ReferenceForm(
      {required this.reference,
      required this.isNew,
      this.additionalFields,
      super.key});

  @override
  State<ReferenceForm> createState() => _ReferenceFormState<T>();
}

class _ReferenceFormState<T extends Reference> extends State<ReferenceForm<T>> {
  T get reference => widget.reference;
  bool get isNew => widget.isNew;
  List<Widget> get fields => widget.additionalFields ?? List<Widget>.empty();
  String get referenceName => reference.itemName();

  List<Widget> _buildFields() {
    var fields = [
      TextFormField(
          initialValue: widget.isNew ? "" : reference.name,
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter a name' : null,
          onChanged: (value) => reference.name = value),
      NotesField(
        modelField: reference.description,
      ),
    ];

    fields.addAll(this.fields);
    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return ItemForm(
      title: referenceName,
      editFields: _buildFields(),
    );
  }
}
