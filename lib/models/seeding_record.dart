import 'models.dart';

enum SeedingMethod { direct, greenhouseSown, transplantFromPurchased }

class SeedingRecord extends Record {
  SeedingMethod seedingMethod = SeedingMethod.direct;

  late double extraSeed;
  late int seedNeeded;
  late double traysNeeded;
  late Equipment seeder;

  SeedingRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      this.seedingMethod)
      : super(tags, title, timestamp, description, isDone, quantities,
            resources, (SeedingRecord).toString());

  SeedingRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seedingMethod = data["seedingMethod"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "seedingMethod": seedingMethod
    };
    map.addAll(super.toMap());
    return map;
  }
}
