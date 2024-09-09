import 'models.dart';

class ActivityRecord extends Record {
  ActivityRecord(
    List<String> tags,
    String title,
    DateTime timestamp,
    String description,
    bool isDone,
    List<Quantity> quantities,
    List<Resource> resources,
  ) : super(tags, title, timestamp, description, isDone, quantities, resources,
            "activity_record");
}
