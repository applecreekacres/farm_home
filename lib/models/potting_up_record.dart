import 'models.dart';

class PottingUpRecord extends Record {
  late DateTime pottingUpDate;

  PottingUpRecord(super.title, super.timestamp, super.notes, super.isDone,
      super.quantities, super.resources, super.tags, this.pottingUpDate);

  PottingUpRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    pottingUpDate = DateTime.fromMillisecondsSinceEpoch(data["pottingUpDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "pottingUpDate": pottingUpDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
