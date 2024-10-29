import 'package:farm_home/constants/constants.dart';

import 'records.dart';

class PottingUpRecord extends Record {
  PottingUpRecord({
    super.title,
    super.timestamp,
    super.notes,
    super.isDone,
    super.quantities,
    super.resourceIds,
    super.tags,
  });

  PottingUpRecord.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return RecordConstants.pottingUp;
  }
}
