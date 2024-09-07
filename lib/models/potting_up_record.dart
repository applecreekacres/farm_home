import 'record.dart';

class PottingUpRecord extends Record {
  late DateTime pottingUpDate;

  PottingUpRecord(
      super.id,
      super.created,
      super.modified,
      super.tags,
      super.title,
      super.description,
      super.isDone,
      super.quantities,
      this.pottingUpDate);

  PottingUpRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    pottingUpDate = DateTime.fromMicrosecondsSinceEpoch(data["pottingUpDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "pottingUpDate": pottingUpDate.microsecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
