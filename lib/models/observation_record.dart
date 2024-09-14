import 'models.dart';

class ObservationRecord extends Record {
  ObservationRecord(
    String title,
    DateTime timestamp,
    String notes,
    bool isDone,
    List<Quantity> quantities,
    List<Resource> resources,
    List<String> tags,
  ) : super(title, timestamp, notes, isDone, quantities, resources, tags,
            (ObservationRecord).toString());
}
