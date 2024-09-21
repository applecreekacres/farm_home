import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class PlantingForm extends StatefulWidget {
  const PlantingForm({super.key});

  @override
  State<StatefulWidget> createState() => _PlantingFormState();
}

class _PlantingFormState extends State<PlantingForm> {
  final _formKey = GlobalKey<FormState>();

  final Planting _planting = Planting();

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Planting>(
      resource: _planting,
      isNew: true,
      key: _formKey,
    );
  }
}
