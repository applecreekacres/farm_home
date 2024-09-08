import 'record.dart';
import 'quantity.dart';

class TransplantRecord extends Record {
  late DateTime transplantDate;

  TransplantRecord(List<String> tags, String title, String description,
      bool isDone, List<Quantity> quantities, this.transplantDate)
      : super(tags, title, description, isDone, quantities,
            "transplanting_record");

  TransplantRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    transplantDate =
        DateTime.fromMillisecondsSinceEpoch(data["transplantDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "transplantDate": transplantDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
