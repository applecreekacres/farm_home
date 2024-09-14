import 'models.dart';

class ActivityRecord extends Record {
  ActivityRecord(
    String title,
    DateTime timestamp,
    String description,
    bool isDone,
    List<Quantity> quantities,
    List<Resource> resources,
    List<String> tags,
  ) : super(title, timestamp, description, isDone, quantities, resources, tags,
            (ActivityRecord).toString());
}
