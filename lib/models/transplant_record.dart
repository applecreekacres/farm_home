import 'models.dart';

class TransplantRecord extends Record {
  late DateTime _transplantDate;

  DateTime get transplantDate => _transplantDate;

  set transplantDate(DateTime date) {
    if (date != _transplantDate) {
      _transplantDate = date;
      update();
    }
  }

  TransplantRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      this._transplantDate)
      : super(tags, title, timestamp, description, isDone, quantities,
            resources, (TransplantRecord).toString());

  TransplantRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _transplantDate =
        DateTime.fromMillisecondsSinceEpoch(data["transplantDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "transplantDate": _transplantDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
