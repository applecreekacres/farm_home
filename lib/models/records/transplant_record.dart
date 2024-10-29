import 'records.dart';

class TransplantRecord extends Record {
  TransplantRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags});

  TransplantRecord.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return "Transplant";
  }
}
