import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

enum StructureType {
  greenhouse,
  building,
  other,
}

class Structure extends Location {
  StructureType? structureType;

  Structure({super.name, super.notes, super.locationType});

  Structure.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    structureType = StructureType.values
        .firstWhere((item) => item.toString() == data["structureType"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll(
      {
        "structureType": structureType.toString(),
      },
    );
    return map;
  }

  @override
  String itemName() {
    return ResourceConstants.structure;
  }
}
