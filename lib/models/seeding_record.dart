import 'models.dart';

enum SeedingMethod { direct, greenhouseSown, transplantFromPurchased }

class SeedingRecord extends Record {
  SeedingMethod seedingMethod = SeedingMethod.direct;

  late double extraSeed;
  late int seedNeeded;
  late double traysNeeded;
  late Equipment seeder;

  SeedingRecord(
      String title,
      DateTime timestamp,
      String notes,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      List<String> tags,
      this.seedingMethod)
      : super(title, timestamp, notes, isDone, quantities, resources,
            tags, (SeedingRecord).toString());

  SeedingRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seedingMethod = data["seedingMethod"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"seedingMethod": seedingMethod};
    map.addAll(super.toMap());
    return map;
  }
}
