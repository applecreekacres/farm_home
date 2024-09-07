import 'record.dart';

class ObservationRecord extends Record {
  ObservationRecord(super.id, super.created, super.modified, super.tags,
      super.title, super.description, super.isDone, super.quantities);
}
