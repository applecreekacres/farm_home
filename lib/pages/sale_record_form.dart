import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class SaleRecordForm extends StatefulWidget {
  final SaleRecord? record;

  const SaleRecordForm({this.record, super.key});

  @override
  State<SaleRecordForm> createState() => _SaleRecordFormState();
}

class _SaleRecordFormState extends State<SaleRecordForm> {
  late SaleRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = SaleRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<SaleRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}
