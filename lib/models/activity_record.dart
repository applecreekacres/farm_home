import 'record.dart';
import 'quantity.dart';

class ActivityRecord extends Record {
  ActivityRecord(List<String> tags, String title, DateTime timestamp,
      String description, bool isDone, List<Quantity> quantities)
      : super(tags, title, timestamp, description, isDone, quantities,
            "activity_record");
}
