import 'record.dart';
import 'quantity.dart';

class SeedingRecord extends Record {
  late DateTime seedingDate;

  SeedingRecord(List<String> tags, String title, DateTime timestamp, String description,
      bool isDone, List<Quantity> quantities, this.seedingDate)
      : super(tags, title, timestamp, description, isDone, quantities, "seeding_record");

  SeedingRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seedingDate = DateTime.fromMicrosecondsSinceEpoch(data["seedingDate"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "seedingDate": seedingDate.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
