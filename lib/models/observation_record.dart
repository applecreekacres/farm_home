import 'models.dart';

class ObservationRecord extends Record {
  ObservationRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resources,
      super.tags});

  @override
  String recordName() {
    return "Observation";
  }
}
