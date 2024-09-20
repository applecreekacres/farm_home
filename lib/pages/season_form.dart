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
    );
  }
}
