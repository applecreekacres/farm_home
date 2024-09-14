import 'models.dart';

class HarvestRecord extends Record {
  late DateTime harvestDate;

  HarvestRecord(
      String title,
      DateTime timestamp,
      String notes,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      List<String> tags,
      this.harvestDate)
      : super(title, timestamp, notes, isDone, quantities, resources,
            tags, (HarvestRecord).toString());

  HarvestRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    harvestDate = DateTime.fromMillisecondsSinceEpoch(data["harvestDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "harvestDate": harvestDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
