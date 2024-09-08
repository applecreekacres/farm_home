import 'record.dart';
import 'quantity.dart';

class PottingUpRecord extends Record {
  late DateTime pottingUpDate;

  PottingUpRecord(List<String> tags, String title, String description,
      bool isDone, List<Quantity> quantities, this.pottingUpDate)
      : super(
            tags, title, description, isDone, quantities, "potting_up_record");

  PottingUpRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    pottingUpDate = DateTime.fromMicrosecondsSinceEpoch(data["pottingUpDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "pottingUpDate": pottingUpDate.microsecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
