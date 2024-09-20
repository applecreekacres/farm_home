import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class SeasonForm extends StatefulWidget {
  final Season? record;

  const SeasonForm({this.record, super.key});

  @override
  State<SeasonForm> createState() => _SeasonFormState();
}

class _SeasonFormState extends State<SeasonForm> {
  late Season _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = Season();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReferenceForm<Season>(
      reference: _record,
      isNew: _isNew,
      additionalFields: [
        DateTimeTextField(
          labelText: "Start",
          value: _record.start,
          onChanged: (value) {
            _record.start = value!;
          },
          initialDate: DateTime(DateTime.now().year),
          firstDate: DateTime(1970),
          lastDate: DateTime(2100),
        ),
        DateTimeTextField(
          labelText: "End",
          value: _record.end,
          onChanged: (value) {
            _record.end = value!;
          },
          initialDate: DateTime(DateTime.now().year, 12, 31, 23, 59, 999),
          firstDate: DateTime(1970),
          lastDate: DateTime(2100),
        ),
      ],
    );
  }
}
