import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

enum LandType { bed, field, orchard, landmark, paddock, property, other }

class Land extends Location {
  LandType? landType = LandType.other;

  Land({super.name, super.notes, this.landType}) : super();

  Land.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    landType =
        LandType.values.firstWhere((e) => e.toString() == data['landType']);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"landType": landType.toString()});
    return map;
  }

  @override
  String itemName() {
    return ResourceConstants.land;
  }
}
