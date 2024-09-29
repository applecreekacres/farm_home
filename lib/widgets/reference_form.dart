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
  final _formKey = GlobalKey<FormState>();
  T get reference => widget.reference;
  bool get isNew => widget.isNew;
  List<Widget> get fields => widget.additionalFields ?? List<Widget>.empty();
  String get referenceName => reference.itemName();

  List<Widget> _buildFields() {
    var fields = [
      TextFormField(
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
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('New $referenceName'),
          actions: [
            IconButton(
                onPressed: () {
                  if (widget.isNew) {
                    createItem<T>(reference);
                  } else {
                    updateItem<T>(reference);
                  }
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: _buildFields(),
          ),
        ),
      ),
    );
  }
}
