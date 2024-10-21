import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AnimalForm extends StatefulWidget {
  const AnimalForm({super.key});

  @override
  State<StatefulWidget> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> {
  final _formKey = GlobalKey<FormState>();

  final Animal _animal = Animal();

  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);
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
        const Text(
          'Sex',
          textAlign: TextAlign.left,
        ),
        DropdownButton<Sex>(
            value: _animal.sex,
            items: Sex.values.map((Sex value) {
              return DropdownMenuItem<Sex>(
                  value: value, child: Text(value.toString().split('.')[1]));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _animal.sex = value as Sex;
              });
            }),
        LabelledCheckbox(
            label: 'Is Fixed',
            value: _animal.isFixed,
            onChanged: (value) {
              _animal.isFixed = value!;
            }),
        FutureWidget(
          future: refProvider.animalSpecies,
          onData: (data) {
            if (data != null) {
              return ReferenceDropDownButton<AnimalSpecies>(
                label: ReferenceConstants.animalSpecies,
                items: data,
                onChanged: (value) {
                  setState(
                    () {
                      _animal.animalSpecies = value;
                    },
                  );
                },
              );
            }
            return const Text("Can't load species");
          },
        ),
      ],
    );
  }
}
