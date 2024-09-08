import 'record.dart';
import 'quantity.dart';

class HarvestRecord extends Record {
  late DateTime harvestDate;

  HarvestRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      this.harvestDate)
      : super(tags, title, timestamp, description, isDone, quantities,
            "harvest_record");

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
