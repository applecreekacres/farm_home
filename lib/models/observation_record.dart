import 'models.dart';

class ObservationRecord extends Record {
  ObservationRecord(
    List<String> tags,
    String title,
    DateTime timestamp,
    String description,
    bool isDone,
    List<Quantity> quantities,
    List<Resource> resources,
  ) : super(tags, title, timestamp, description, isDone, quantities, resources,
            (ObservationRecord).toString());
}
