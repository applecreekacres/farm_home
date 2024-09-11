import 'models.dart';

class HarvestRecord extends Record {
  late DateTime _harvestDate;

  DateTime get harvestDate => _harvestDate;

  set harvestDate(DateTime date) {
    if (date != _harvestDate) {
      _harvestDate = date;
      update();
    }
  }

  HarvestRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      this._harvestDate)
      : super(tags, title, timestamp, description, isDone, quantities,
            resources, (HarvestRecord).toString());

  HarvestRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _harvestDate = DateTime.fromMillisecondsSinceEpoch(data["harvestDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "harvestDate": _harvestDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
