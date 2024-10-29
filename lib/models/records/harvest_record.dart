import 'package:farm_home/constants/constants.dart';

import 'records.dart';

class HarvestRecord extends Record {
  String lotNumber = "";

  HarvestRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags,
      this.lotNumber = ""});

  HarvestRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    lotNumber = data["lotNumber"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"lotNumber": lotNumber};
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return RecordConstants.harvest;
  }
}
