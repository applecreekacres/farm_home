import 'record.dart';

class SeedingRecord extends Record {
  late DateTime seedingDate;

  SeedingRecord(
      super.id,
      super.created,
      super.modified,
      super.tags,
      super.title,
      super.description,
      super.isDone,
      super.quantities,
      this.seedingDate);

  SeedingRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seedingDate =
        DateTime.fromMicrosecondsSinceEpoch(data["seedingDate"]);
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
