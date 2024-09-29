import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class EquipmentForm extends StatefulWidget {
  const EquipmentForm({super.key});

  @override
  State<StatefulWidget> createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  final _formKey = GlobalKey<FormState>();

  final Equipment _equipment = Equipment();

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Equipment>(
      resource: _equipment,
      isNew: true,
      key: _formKey,
      additionalFields: [
        TextFormField(
          decoration: const InputDecoration(labelText: "Manufacturer"),
          onChanged:(value) => _equipment.manufacturer = value,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: "Model"),
          onChanged: (value) => _equipment.model = value,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: "Serial Number"),
          onChanged: (value) => _equipment.serialNumber = value,
        ),
      ],
    );
  }
}
