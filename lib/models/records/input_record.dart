import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class InputRecord extends Record {
  String materialId = "";

  InputRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags,
      this.materialId = ""})
      : super();

  InputRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    materialId = data["materialId"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"materialId": materialId});
    return map;
  }

  @override
  String itemName() {
    return RecordConstants.input;
  }
}
