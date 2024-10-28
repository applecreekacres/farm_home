import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';

class RecordCategoryForm extends StatefulWidget {
  final RecordCategory? record;

  const RecordCategoryForm({this.record, super.key});

  @override
  State<RecordCategoryForm> createState() => _RecordCategoryFormState();
}

class _RecordCategoryFormState extends State<RecordCategoryForm> {
  late RecordCategory _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = RecordCategory();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReferenceForm<RecordCategory>(
      reference: _record,
      isNew: _isNew,
    );
  }
}
