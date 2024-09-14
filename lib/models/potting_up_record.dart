import 'models.dart';

class PottingUpRecord extends Record {
  late DateTime pottingUpDate;

  PottingUpRecord(
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      List<String> tags,
      this.pottingUpDate)
      : super(title, timestamp, description, isDone, quantities, resources,
            tags, (PottingUpRecord).toString());

  PottingUpRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    pottingUpDate = DateTime.fromMillisecondsSinceEpoch(data["pottingUpDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "pottingUpDate": pottingUpDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
