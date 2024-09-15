import 'models.dart';

class HarvestRecord extends Record {
  late DateTime harvestDate;

  HarvestRecord(super.title, super.timestamp, super.notes, super.isDone,
      super.quantities, super.resources, super.tags, this.harvestDate);

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
