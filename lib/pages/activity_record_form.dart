import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';
import 'package:farm_home/widgets/widgets.dart';

class ActivityRecordForm extends StatefulWidget {
  const ActivityRecordForm({super.key});

  @override
  State<ActivityRecordForm> createState() => _ActivityRecordFormState();
}

class _ActivityRecordFormState extends State<ActivityRecordForm> {
  ActivityRecord _record =
      ActivityRecord("", DateTime.now(), "", false, [], [], []);

  @override
  Widget build(BuildContext context) {
    return RecordForm<ActivityRecord>(record: _record);
  }
}
