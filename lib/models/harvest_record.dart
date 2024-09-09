import 'models.dart';

class HarvestRecord extends Record {
  late DateTime harvestDate;

  HarvestRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      this.harvestDate)
      : super(tags, title, timestamp, description, isDone, quantities,
            resources, (HarvestRecord).toString());

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
