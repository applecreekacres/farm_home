import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class UnitForm extends StatefulWidget {
  final Unit? record;

  const UnitForm({this.record, super.key});

  @override
  State<UnitForm> createState() => _UnitFormState();
}

class _UnitFormState extends State<UnitForm> {
  late Unit _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = Unit();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReferenceForm<Unit>(
      reference: _record,
      isNew: _isNew,
      additionalFields: [
        const Text(
          'Unit Type',
          textAlign: TextAlign.left,
        ),
        DropdownButton<UnitType>(
            value: _record.unitType,
            items: UnitType.values.map((UnitType value) {
              return DropdownMenuItem<UnitType>(
                  value: value, child: Text(value.toString().split('.')[1]));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _record.unitType = value as UnitType;
              });
            }),
      ],
    );
  }
}
