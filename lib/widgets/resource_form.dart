import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class ResourceForm<T extends Resource> extends StatefulWidget {
  final T resource;
  final List<Widget>? additionalFields;

  const ResourceForm(
      {required this.resource, this.additionalFields, super.key});

  @override
  State<ResourceForm> createState() => _ResourceFormState<T>();
}

class _ResourceFormState<T extends Resource> extends State<ResourceForm<T>> {
  final _formKey = GlobalKey<FormState>();
  T get resource => widget.resource;
  String get resourceName => widget.resource.resourceType;
  List<Widget> get fields => widget.additionalFields ?? List<Widget>.empty();

  List<Widget> _buildFields() {
    var fields = [
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
    ];
    fields.addAll(this.fields);
    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text('New $resourceName'),
            actions: [
              IconButton(
                  onPressed: () => createItem<T>(resource),
                  icon: const Icon(Icons.save))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.notes)),
                Tab(icon: Icon(Icons.add_chart)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: _buildFields(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
