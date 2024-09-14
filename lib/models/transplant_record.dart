import 'models.dart';

class TransplantRecord extends Record {
  late DateTime transplantDate;

  TransplantRecord(
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      List<String> tags,
      this.transplantDate)
      : super(title, timestamp, description, isDone, quantities, resources,
            tags, (TransplantRecord).toString());

  TransplantRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    transplantDate =
        DateTime.fromMillisecondsSinceEpoch(data["transplantDate"]);
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
