import 'package:farm_home/models/models.dart';

class MaintenanceRecord extends Record {
  List<String> _equipmentUsedId = List<String>.empty();
  List<Equipment> _equipmentUsed = List<Equipment>.empty();

  List<Equipment> get equipmentUsed {
    if (_equipmentUsedId.isNotEmpty && _equipmentUsed.isEmpty) {
      _equipmentUsed = _equipmentUsedId
          .map((id) => getItemById<Equipment>(id) as Equipment)
          .toList();
    }
    return _equipmentUsed;
  }

  set equipmentUsed(List<Equipment> e) {
    _equipmentUsed = e;
    _equipmentUsedId = _equipmentUsed.map((e) => e.id).toList();
  }

  MaintenanceRecord(super.title, super.timestamp, super.notes, super.isDone,
      super.quantities, super.resources, super.tags, this._equipmentUsed) {
    _equipmentUsedId = _equipmentUsed.map((e) => e.id).toList();
  }

  MaintenanceRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _equipmentUsedId = data["equipmentUsedId"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"equipmentUsedId": _equipmentUsedId});
    return map;
  }
}
