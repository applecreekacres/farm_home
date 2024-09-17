import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/pages/datetime_text_field.dart';
import 'package:farm_home/widgets/labeled_checkbox.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AnimalNewPage extends StatefulWidget {
  const AnimalNewPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimalNewPageState();
}

class _AnimalNewPageState extends State<AnimalNewPage> {
  final _formKey = GlobalKey<FormState>();

  Animal _animal =
      Animal("", "", DateTime.now(), false, null, "", Sex.male, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("New Animal"),
          actions: [
            IconButton(
              onPressed: () {
                createItem<Animal>(_animal);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save),
            )
          ]),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(children: [
            TextFormField(
                decoration: const InputDecoration(labelText: "Nickname"),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Please enter a name' : null,
                onChanged: (value) => _animal.nickname = value),
            DateTimeTextField(
                labelText: 'Birth Date',
                value: _animal.birthDate,
                onChanged: (value) {
                  _animal.birthDate = value!;
                },
                initialDate: DateTime.now()),
            DateTimeTextField(
                labelText: 'Death Date',
                value: _animal.deathDate,
                onChanged: (value) {
                  _animal.deathDate = value!;
                },
                initialDate: DateTime.now()),
            Row(
              children: [
                Column(
                  children: [
                    const Text(
                      'Sex',
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton<Sex>(
                        items: Sex.values.map((value) {
                          return DropdownMenuItem<Sex>(
                              value: value,
                              child: Text(value.toString().split('.')[1]));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _animal.sex = value as Sex;
                          });
                        })
                  ],
                ),
                LabelledCheckbox(
                    label: 'Is Fixed',
                    value: _animal.isFixed,
                    onChanged: (value) {
                      _animal.isFixed = value!;
                    }),
              ],
            ),
            NotesField(modelField: _animal.notes),
          ]),
        ),
      ),
    );
  }
}
