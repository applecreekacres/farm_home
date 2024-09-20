import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class CropFamilyForm extends StatefulWidget {
  final CropFamily? record;

  const CropFamilyForm({this.record, super.key});

  @override
  State<CropFamilyForm> createState() => _CropFamilyFormState();
}

class _CropFamilyFormState extends State<CropFamilyForm> {
  late CropFamily _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = CropFamily();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReferenceForm<CropFamily>(
      reference: _record,
      isNew: _isNew,
    );
  }
}
