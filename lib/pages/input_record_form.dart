import 'package:flutter/material.dart' hide MaterialType;

import 'package:provider/provider.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';

class InputRecordForm extends StatefulWidget {
  final InputRecord? record;

  const InputRecordForm({this.record, super.key});

  @override
  State<InputRecordForm> createState() => _InputRecordFormState();
}

class _InputRecordFormState extends State<InputRecordForm> {
  late InputRecord _record;
  bool _isNew = false;

  @override
  void initState() {
    if (widget.record == null) {
      _record = InputRecord();
      _isNew = true;
    } else {
      _record = widget.record!;
    }
    super.initState();
  }

  MaterialType? selectInitial(List<MaterialType> data) {
    if (data.isNotEmpty) {
      if (_record.materialId == "") {
        return data.first;
      } else {
        return data.where((item) => item.id == _record.materialId).first;
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var refProvider = Provider.of<ReferenceProvider>(context);
    return RecordForm<InputRecord>(
      record: _record,
      isNew: _isNew,
      additionalFields: [
        FutureWidget(
            future: refProvider.materialType,
            onData: (data) {
              if (data != null) {
                return ReferenceDropDownButton<MaterialType>(
                  initialValue: selectInitial(data),
                  label: ReferenceConstants.materialType,
                  items: data,
                  onChanged: (data) {
                    _record.materialId = (data as MaterialType).id;
                  },
                );
              } else {
                return const Text("Couldn't load material types.");
              }
            })
      ],
    );
  }
}
