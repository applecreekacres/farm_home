import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class PurchaseRecordForm extends StatefulWidget {
  final PurchaseRecord? record;

  const PurchaseRecordForm({this.record, super.key});

  @override
  State<PurchaseRecordForm> createState() => _PurchaseRecordFormState();
}

class _PurchaseRecordFormState extends State<PurchaseRecordForm> {
  late PurchaseRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = PurchaseRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<PurchaseRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}