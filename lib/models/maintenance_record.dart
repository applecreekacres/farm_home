import 'package:farm_home/models/models.dart';

class MaintenanceRecord extends Record {
  List<String> _equipmentUsedId = List<String>.empty();
  List<Equipment>? equipmentUsed = List<Equipment>.empty();

  List<Equipment>? get equipment {
    if (_equipmentUsedId.isNotEmpty && equipmentUsed!.isEmpty) {
      equipmentUsed = _equipmentUsedId
          .map((id) => getItemById(Equipment.collectionName, id) as Equipment)
          .toList();
    }
    return equipmentUsed;
  }

  set equipment(List<Equipment>? e) {
    equipmentUsed = e;
    _equipmentUsedId = equipmentUsed!.map((e) => e.id).toList();
  }

  MaintenanceRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resources,
      super.tags,
      this.equipmentUsed})
      : super();

  MaintenanceRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _equipmentUsedId = data["equipmentUsedId"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"equipmentUsedId": _equipmentUsedId});
    return map;
  }

  @override
  String itemName() {
    return "Maintenance";
  }
}
