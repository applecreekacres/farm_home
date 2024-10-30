import 'package:farm_home/constants/constants.dart';

import 'records.dart';

class ObservationRecord extends Record {
  ObservationRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags});

  ObservationRecord.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return RecordConstants.observation;
  }
}
