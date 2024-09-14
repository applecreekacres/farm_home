import 'models.dart';

class ObservationRecord extends Record {
  ObservationRecord(
    String title,
    DateTime timestamp,
    String description,
    bool isDone,
    List<Quantity> quantities,
    List<Resource> resources,
    List<String> tags,
  ) : super(title, timestamp, description, isDone, quantities, resources, tags,
            (ObservationRecord).toString());
}
