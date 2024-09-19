import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class MaintenanceRecordForm extends StatefulWidget {
  final MaintenanceRecord? record;

  const MaintenanceRecordForm({this.record, super.key});

  @override
  State<MaintenanceRecordForm> createState() => _MaintenanceRecordFormState();
}

class _MaintenanceRecordFormState extends State<MaintenanceRecordForm> {
  late MaintenanceRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = MaintenanceRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<MaintenanceRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}
