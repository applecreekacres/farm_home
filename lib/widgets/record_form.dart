import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class RecordForm<T extends Record> extends StatefulWidget {
  final T record;
  final List<Widget>? additionalFields;
  final bool isNew;

  const RecordForm(
      {required this.record,
      required this.isNew,
      this.additionalFields,
      super.key});

  @override
  State<RecordForm> createState() => _RecordFormState<T>();
}

class _RecordFormState<T extends Record> extends State<RecordForm<T>> {
  final _formKey = GlobalKey<FormState>();
  T get record => widget.record;
  List<Widget> get fields => widget.additionalFields ?? List<Widget>.empty();
  String get itemName => record.itemName();

  List<Widget> _buildFields() {
    List<Widget> fields = [
      TextFormField(
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter a name' : null,
          onChanged: (value) => record.title = value),
      LabelledCheckbox(
        label: 'Done',
        value: record.isDone!,
        onChanged: (value) {
          record.isDone = value!;
        },
      ),
      DateTimeTextField(
          labelText: 'Timestamp',
          firstDate: DateTime(1970),
          lastDate: DateTime(2100),
          value: record.timestamp,
          onChanged: (value) {
            record.timestamp = value!;
          },
          initialDate: DateTime.now()),
      NotesField(
        modelField: record.notes!,
        onChanged: (value) {
          record.notes = value;
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
            title: Text('New $itemName Record'),
            actions: [
              IconButton(
                  onPressed: () {
                    if (widget.isNew) {
                      createItem<T>(record);
                    } else {
                      updateItem<T>(record);
                    }
                    Navigator.of(context).pop();
                  },
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
