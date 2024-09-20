import 'models.dart';

class ActivityRecord extends Record {
  ActivityRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resources,
      super.tags});

  @override
  String itemName() {
    return "Activity";
  }
}
