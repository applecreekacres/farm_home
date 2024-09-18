import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class ReferenceForm<T extends Reference> extends StatefulWidget {
  final T reference;

  const ReferenceForm({required this.reference, super.key});

  @override
  State<ReferenceForm> createState() => _ReferenceFormState<T>();
}

class _ReferenceFormState<T extends Reference> extends State<ReferenceForm<T>> {
  final _formKey = GlobalKey<FormState>();
  T get reference => widget.reference;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a name' : null,
                onChanged: (value) => reference.name = value),
            NotesField(
              modelField: reference.description,
              onChanged: (value) {
                setState(() {
                  reference.description = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
