import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';
import 'package:farm_home/widgets/widgets.dart';

class ObservationRecordForm extends StatefulWidget {
  const ObservationRecordForm({super.key});

  @override
  State<ObservationRecordForm> createState() => _ObservationRecordFormState();
}

class _ObservationRecordFormState extends State<ObservationRecordForm> {
  ObservationRecord _record =
      ObservationRecord("", DateTime.now(), "", false, [], [], []);

  @override
  Widget build(BuildContext context) {
    return RecordForm<ObservationRecord>(record: _record);
  }
}
