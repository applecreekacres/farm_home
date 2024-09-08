import 'record.dart';
import 'quantity.dart';

class ObservationRecord extends Record {
  ObservationRecord(List<String> tags, String title, String description,
      bool isDone, List<Quantity> quantities)
      : super(
            tags, title, description, isDone, quantities, "observation_record");
}
