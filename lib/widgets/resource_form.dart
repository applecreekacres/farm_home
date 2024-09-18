import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class ResourceForm<T extends Resource> extends StatefulWidget {
  final T resource;

  const ResourceForm({required this.resource, super.key});

  @override
  State<ResourceForm> createState() => _ResourceFormState<T>();
}

class _ResourceFormState<T extends Resource> extends State<ResourceForm<T>> {
  final _formKey = GlobalKey<FormState>();
  T get resource => widget.resource;

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
                onChanged: (value) => resource.name = value),
            NotesField(
              modelField: resource.notes,
              onChanged: (value) {
                setState(() {
                  resource.notes = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
