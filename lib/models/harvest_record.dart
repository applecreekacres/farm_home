import 'record.dart';

class HarvestRecord extends Record {
  late DateTime harvestDate;

  HarvestRecord(
      super.id,
      super.created,
      super.modified,
      super.tags,
      super.title,
      super.description,
      super.isDone,
      super.quantities,
      this.harvestDate);

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
