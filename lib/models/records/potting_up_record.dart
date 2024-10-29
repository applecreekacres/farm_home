import '../models.dart';

class PottingUpRecord extends Record {
  PottingUpRecord({
    super.title,
    super.timestamp,
    super.notes,
    super.isDone,
    super.quantities,
    super.resources,
    super.tags,
  });

  PottingUpRecord.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return "Potting Up";
  }
}
