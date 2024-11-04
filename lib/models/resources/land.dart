import 'package:farm_home/constants/constants.dart';

import 'resources.dart';

enum LandType { bed, field, landmark, paddock, property, other }

class Land extends Resource {
  LandType? landType = LandType.other;

  Land({super.name, super.notes, this.landType}) : super();

  Land.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    landType = data["landType"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"landType": landType});
    return map;
  }

  @override
  String itemName() {
    return ResourceConstants.land;
  }
}
