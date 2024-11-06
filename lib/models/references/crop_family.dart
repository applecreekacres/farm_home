import 'package:farm_home/constants/reference_constants.dart';

import 'references.dart';

enum GrowingCycle {
  annual,
  perennial,
  biennial;
}

class CropFamily extends Reference {
  List<GrowingCycle>? growingCycles;

  CropFamily({super.name, super.description, this.growingCycles});

  CropFamily.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (data.containsKey("growingCycles")) {
      growingCycles = List<String>.from(data["growingCycles"])
          .map((str) => GrowingCycle.values
              .firstWhere((cycle) => cycle.toString() == str))
          .toList();
    } else {
      growingCycles = [];
    }
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      "growingCycles": growingCycles?.map((item) => item.toString()),
    });
    return map;
  }

  @override
  String itemName() {
    return ReferenceConstants.cropFamily;
  }
}
