import 'record.dart';
import 'quantity.dart';

class ObservationRecord extends Record {
  ObservationRecord(List<String> tags, String title, DateTime timestamp,
      String description, bool isDone, List<Quantity> quantities)
      : super(tags, title, timestamp, description, isDone, quantities,
            "observation_record");
}
