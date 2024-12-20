import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class MaintenanceRecord extends Record {
  List<String> _equipmentUsedId = List<String>.empty();
  List<Equipment>? equipmentUsed = List<Equipment>.empty();

  MaintenanceRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags,
      this.equipmentUsed})
      : super();

  MaintenanceRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _equipmentUsedId = List<String>.from(data["equipmentUsedId"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"equipmentUsedId": _equipmentUsedId});
    return map;
  }

  @override
  String itemName() {
    return RecordConstants.maintenance;
  }
}
