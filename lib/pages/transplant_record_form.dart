import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class TransplantRecordForm extends StatefulWidget {
  final TransplantRecord? record;

  const TransplantRecordForm({this.record, super.key});

  @override
  State<TransplantRecordForm> createState() => _TransplantRecordFormState();
}

class _TransplantRecordFormState extends State<TransplantRecordForm> {
  late TransplantRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = TransplantRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<TransplantRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}
