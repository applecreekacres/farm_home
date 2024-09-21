import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class AnimalSpeciesForm extends StatefulWidget {
  final AnimalSpecies? record;

  const AnimalSpeciesForm({this.record, super.key});

  @override
  State<AnimalSpeciesForm> createState() => _AnimalSpeciesFormState();
}

class _AnimalSpeciesFormState extends State<AnimalSpeciesForm> {
  late AnimalSpecies _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = AnimalSpecies();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReferenceForm<AnimalSpecies>(
      reference: _record,
      isNew: _isNew,
    );
  }
}
