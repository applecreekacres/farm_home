import 'record.dart';
import 'quantity.dart';

class ActivityRecord extends Record {
  ActivityRecord(List<String> tags, String title, String description,
      bool isDone, List<Quantity> quantities)
      : super(tags, title, description, isDone, quantities, "activity_record");
}
