import 'package:material_ui/material_ui.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class ActivityRecordForm extends StatefulWidget {
  final ActivityRecord? record;

  const ActivityRecordForm({this.record, super.key});

  @override
  State<ActivityRecordForm> createState() => _ActivityRecordFormState();
}

class _ActivityRecordFormState extends State<ActivityRecordForm> {
  late ActivityRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = ActivityRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RecordForm<ActivityRecord>(
      record: _record,
      isNew: _isNew,
    );
  }
}
