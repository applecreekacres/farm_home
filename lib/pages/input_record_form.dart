import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart' hide MaterialType;

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';

class InputRecordForm extends ConsumerStatefulWidget {
  final InputRecord? record;

  const InputRecordForm({this.record, super.key});

  @override
  ConsumerState<InputRecordForm> createState() => _InputRecordFormState();
}

class _InputRecordFormState extends ConsumerState<InputRecordForm> {
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
    final materialTypes = ref.watch(materialTypesProvider);
    return RecordForm<InputRecord>(
      record: _record,
      isNew: _isNew,
      additionalFields: [
        AsyncValueView<List<MaterialType>>(
          value: materialTypes,
          onData: (data) {
            return ReferenceDropDownButton<MaterialType>(
              initialValue: selectInitial(data),
              label: ReferenceConstants.materialType,
              items: data,
              onChanged: (data) {
                _record.materialId = (data as MaterialType).id;
              },
            );
          },
          onError: (error) => const Text("Couldn't load material types."),
        ),
      ],
    );
  }
}
