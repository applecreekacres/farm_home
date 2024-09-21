import 'package:flutter/material.dart' hide MaterialType;

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class MaterialTypeForm extends StatefulWidget {
  final MaterialType? record;

  const MaterialTypeForm({this.record, super.key});

  @override
  State<MaterialTypeForm> createState() => _MaterialTypeFormState();
}

class _MaterialTypeFormState extends State<MaterialTypeForm> {
  late MaterialType _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = MaterialType();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReferenceForm<MaterialType>(
      reference: _record,
      isNew: _isNew,
    );
  }
}
