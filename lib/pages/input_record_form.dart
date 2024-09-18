import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class InputRecordForm extends StatefulWidget {
  const InputRecordForm({super.key});

  @override
  State<InputRecordForm> createState() => _InputRecordFormState();
}

class _InputRecordFormState extends State<InputRecordForm> {
  InputRecord _record =
      InputRecord("", DateTime.now(), "", false, [], [], [], null);

  @override
  Widget build(BuildContext context) {
    return RecordForm<InputRecord>(record: _record);
  }
}
