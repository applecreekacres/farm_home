import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

class SeasonFormPage extends StatefulWidget {
  const SeasonFormPage({super.key});

  @override
  State<StatefulWidget> createState() => _SeasonFormPageState();
}

class _SeasonFormPageState extends State<SeasonFormPage> {
  final _formKey = GlobalKey<FormState>();

  final Season _season = Season(List<String>.empty(), "", "");

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _season.start,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _season.start = pickedDate;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _season.end,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _season.end = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Season"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a name' : null,
                onChanged: (value) {
                  _season.name = value;
                },
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    labelText: 'Start Date',
                    suffixIcon: IconButton(
                        onPressed: () => _selectStartDate(context),
                        icon: const Icon(Icons.calendar_today))),
                controller:
                    TextEditingController(text: _season.start.toString()),
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    labelText: 'End Date',
                    suffixIcon: IconButton(
                        onPressed: () => _selectEndDate(context),
                        icon: const Icon(Icons.calendar_today))),
                controller: TextEditingController(text: _season.end.toString()),
              )
            ],
          ),
        ));
  }
}
