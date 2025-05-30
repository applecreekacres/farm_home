import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AnimalForm extends StatefulWidget {
  final Animal? resource;

  const AnimalForm({super.key, this.resource});

  @override
  State<StatefulWidget> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalForm> with SingleTickerProviderStateMixin { // Add SingleTickerProviderStateMixin
  final _formKey = GlobalKey<FormState>();
  late bool isNew = true;
  late Animal _animal;

  // Animation variables
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    if (widget.resource != null) {
      _animal = widget.resource!;
      isNew = false;
    } else {
      _animal = Animal();
    }
    super.initState();

    // Initialize animation controller and animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000), // Animation duration
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn, // Animation curve
    );

    // Start the animation when the page loads
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);
    return FadeTransition( // Use FadeTransition for opacity animation
      opacity: _animation,
      child: SlideTransition( // Use SlideTransition for sliding animation
        position: Tween<Offset>(
          begin: const Offset(0, 0.1), // Start from slightly below
          end: Offset.zero,
        ).animate(_animation),
        child: ResourceForm<Animal>(
          resource: _animal,
          key: _formKey,
          isNew: isNew,
          additionalFields: [
            TextFormField(
                decoration: const InputDecoration(labelText: 'Nickname'),
                initialValue: _animal.nickname,
                onChanged: (value) {
                  _animal.nickname = value;
                }),
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
            LabeledDropdownButton<Sex>(
              initialValue: _animal.sex,
              label: "Sex",
              items: Sex.values,
              itemView: (item) {
                return item.toString().split('.')[1];
              },
              onChanged: (item) {
                _animal.sex = item!;
              },
            ),
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
                  return FutureWidget(
                    future: refProvider.access.getItemById<AnimalSpecies>(
                        _animal.animalSpeciesId,
                            (item) => initReferenceByItemName(item)),
                    onData: (species) {
                      return ReferenceDropDownButton<AnimalSpecies>(
                        initialValue: species,
                        label: ReferenceConstants.animalSpecies,
                        items: data,
                        onChanged: (value) {
                          _animal.animalSpeciesId = value?.id ?? "";
                        },
                      );
                    },
                    onLoading: () => CircularProgressIndicator(),
                  );
                }
                return const Text("Can't load species");
              },
            ),
          ],
        ),
      ),
    );
  }
}
