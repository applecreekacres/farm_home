import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class ObservationRecordForm extends StatefulWidget {
  final ObservationRecord? record;

  const ObservationRecordForm({this.record, super.key});

  @override
  State<ObservationRecordForm> createState() => _ObservationRecordFormState();
}

class _ObservationRecordFormState extends State<ObservationRecordForm> {
  late ObservationRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = ObservationRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<ObservationRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}
