import 'records.dart';

class ActivityRecord extends Record {
  ActivityRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags});

  ActivityRecord.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return "Activity";
  }
}
