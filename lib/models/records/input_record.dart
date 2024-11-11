import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class InputRecord extends Record {
  String _materialId = "";

  InputRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags,
      Material? material})
      : super() {
    _materialId = material?.id ?? "";
  }

  InputRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _materialId = data["materialId"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"materialId": _materialId});
    return map;
  }

  @override
  String itemName() {
    return RecordConstants.input;
  }
}
