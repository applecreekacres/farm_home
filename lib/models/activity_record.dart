import 'models.dart';

class ActivityRecord extends Record {
  ActivityRecord(
    String title,
    DateTime timestamp,
    String notes,
    bool isDone,
    List<Quantity> quantities,
    List<Resource> resources,
    List<String> tags,
  ) : super(title, timestamp, notes, isDone, quantities, resources, tags,
            (ActivityRecord).toString());
}
