import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class EquipmentForm extends StatefulWidget {
  final Equipment? resource;

  const EquipmentForm({super.key, this.resource});

  @override
  State<StatefulWidget> createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  late Equipment _equipment;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.resource == null) {
      _equipment = Equipment();
      _isNew = true;
    } else {
      _equipment = widget.resource!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Equipment>(
      resource: _equipment,
      isNew: _isNew,
      additionalFields: [
        TextFormField(
          decoration: const InputDecoration(labelText: "Manufacturer"),
          onChanged: (value) => _equipment.manufacturer = value,
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
