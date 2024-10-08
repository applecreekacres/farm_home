import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class AnimalForm extends StatefulWidget {
  const AnimalForm({super.key});

  @override
  State<StatefulWidget> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  final _formKey = GlobalKey<FormState>();

  final Animal _animal = Animal();
  List<AnimalSpecies> _allSpecies = [];

  Future<void> _getSpecies() async {
    var data = await getItemsByUser(AnimalSpecies.collectionName);
    setState(() {
      _allSpecies = data.map((d) => AnimalSpecies.fromMap(d)).toList();
    });
  }

  @override
  void initState() {
    _getSpecies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Animal>(
      resource: _animal,
      key: _formKey,
      isNew: true,
      additionalFields: [
        DateTimeTextField(
            labelText: 'Birth Date',
            firstDate: DateTime(1970),
            lastDate: DateTime.now(),
            value: _animal.birthDate,
            onChanged: (value) {
              _animal.birthDate = value!;
            },
            initialDate: DateTime.now()),
        DateTimeTextField(
            labelText: 'Death Date',
            firstDate: DateTime(1970),
            lastDate: DateTime.now(),
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
                    value: _animal.sex,
                    items: Sex.values.map((Sex value) {
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
            Column(
              children: [
                const Text(
                  'Species',
                  textAlign: TextAlign.left,
                ),
                DropdownButton<AnimalSpecies>(
                    value: _animal.animalSpecies,
                    items: _allSpecies.map((AnimalSpecies value) {
                      return DropdownMenuItem<AnimalSpecies>(
                          value: value,
                          child: Text(value.name));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _animal.animalSpecies = value;
                      });
                    })
              ],
            ),
          ],
        ),
      ],
    );
  }
}
