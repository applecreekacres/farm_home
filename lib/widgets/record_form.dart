import 'package:farm_home/pages/datetime_text_field.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:farm_home/models/models.dart';

class RecordForm<T extends Record> extends StatefulWidget {
  final T record;
  List<Widget>? additionalFields = List<Widget>.empty();

  RecordForm({required this.record, this.additionalFields, super.key});

  @override
  State<RecordForm> createState() => _RecordFormState<T>();
}

class _RecordFormState<T extends Record> extends State<RecordForm<T>> {
  final _formKey = GlobalKey<FormState>();
  T get record => widget.record;
  List<Widget> get fields => widget.additionalFields ?? List<Widget>.empty();
  String get recordName => record.recordType.replaceFirst("Record", '');

  List<Widget> _buildFields() {
    List<Widget> fields = [
      TextFormField(
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter a name' : null,
          onChanged: (value) => record.title = value),
      LabelledCheckbox(label: 'Done', value: record.isDone),
      DateTimeTextField(
          labelText: 'Timestamp',
          value: record.timestamp,
          onChanged: (value) {
            record.timestamp = value!;
          },
          initialDate: DateTime.now()),
      NotesField(modelField: record.notes),
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
            title: Text('New $recordName Record'),
            actions: [
              IconButton(
                  onPressed: () => createItem<T>(record),
                  icon: const Icon(Icons.save))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.notes_outlined)),
                Tab(icon: Icon(Icons.add_chart_outlined)),
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
