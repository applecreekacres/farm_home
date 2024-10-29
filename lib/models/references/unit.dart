import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

enum UnitType {
  count,
  length,
  weight,
  area,
  volume,
  mass,
  time,
  temperature,
  pressure,
  value,
  rate,
  rating,
  ratio,
  probability,
  speed
}

class Unit extends Reference {
  UnitType? unitType = UnitType.count;

  Unit({super.name, super.description, this.unitType});

  Unit.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    unitType = data["unitType"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"unitType": unitType});
    return map;
  }

  @override
  String itemName() {
    return ReferenceConstants.unit;
  }
}
