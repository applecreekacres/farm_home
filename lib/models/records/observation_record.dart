import '../models.dart';

class ObservationRecord extends Record {
  ObservationRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resources,
      super.tags});

  ObservationRecord.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return "Observation";
  }
}
