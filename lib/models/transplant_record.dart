import 'models.dart';

class TransplantRecord extends Record {
  late DateTime? transplantDate = DateTime.now();

  TransplantRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resources,
      super.tags,
      this.transplantDate});

  TransplantRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    transplantDate =
        DateTime.fromMillisecondsSinceEpoch(data["transplantDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "transplantDate": transplantDate?.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return "Transplant";
  }
}
