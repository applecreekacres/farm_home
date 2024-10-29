import 'package:farm_home/models/resources/resources.dart';

import 'records.dart';

enum SeedingMethod { direct, greenhouseSown, transplantFromPurchased }

class SeedingRecord extends Record {
  SeedingMethod? seedingMethod = SeedingMethod.direct;

  late double? extraSeed;
  late int? seedNeeded;
  late double? traysNeeded;
  late Equipment? seeder;

  SeedingRecord(
      {super.title,
      super.timestamp,
      super.notes,
      super.isDone,
      super.quantities,
      super.resourceIds,
      super.tags,
      this.seedingMethod,
      this.extraSeed,
      this.traysNeeded,
      this.seeder});

  SeedingRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    seedingMethod = data["seedingMethod"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"seedingMethod": seedingMethod};
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return "Seeding";
  }
}
