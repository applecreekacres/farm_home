import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class SeedingRecordForm extends StatefulWidget {
  final SeedingRecord? record;

  const SeedingRecordForm({this.record, super.key});

  @override
  State<SeedingRecordForm> createState() => _SeedingRecordFormState();
}

class _SeedingRecordFormState extends State<SeedingRecordForm> {
  late SeedingRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = SeedingRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<SeedingRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}
