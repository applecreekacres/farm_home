import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class HarvestRecordForm extends StatefulWidget {
  final HarvestRecord? record;

  const HarvestRecordForm({this.record, super.key});

  @override
  State<HarvestRecordForm> createState() => _HarvestRecordFormState();
}

class _HarvestRecordFormState extends State<HarvestRecordForm> {
  late HarvestRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = HarvestRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<HarvestRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}
