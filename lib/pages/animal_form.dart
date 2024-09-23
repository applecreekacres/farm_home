import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:farm_home/providers/providers.dart';

class AnimalForm extends StatefulWidget {
  final bool isNew;
  final Animal? animal;

  const AnimalForm({super.key, this.animal, this.isNew = false});

  @override
  State<StatefulWidget> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  final _formKey = GlobalKey<FormState>();

  late Animal _animal;
  List<AnimalSpecies> _allSpecies = [];

  Future<void> _getSpecies() async {
    var data = await getItemsByUser(AnimalSpecies.collectionName);
    setState(() {
      _allSpecies = data.map((d) => AnimalSpecies.fromMap(d)).toList();
    });
  }

  @override
  void initState() {
    _animal = widget.isNew
        ? Animal()
        : Provider.of<ResourceProvider<Animal>>(context, listen: false).resource!;
    _getSpecies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Animal>(
      resource: _animal,
      key: _formKey,
      isNew: widget.isNew,
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
                          value: value, child: Text(value.name));
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
