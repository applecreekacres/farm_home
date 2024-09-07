import 'record.dart';

class TransplantRecord extends Record {
  late DateTime transplantDate;

  TransplantRecord(
      super.id,
      super.created,
      super.modified,
      super.tags,
      super.title,
      super.description,
      super.isDone,
      super.quantities,
      this.transplantDate);

  TransplantRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    transplantDate =
        DateTime.fromMicrosecondsSinceEpoch(data["transplantDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "transplantDate": transplantDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
