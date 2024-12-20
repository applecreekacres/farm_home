import 'package:farm_home/constants/resource_constants.dart';
import 'package:farm_home/models/models.dart';

enum PlantingMethod { directSow, greenhouseSow, transplantFromPurchased }

class Planting extends Resource {
  String cropId = "";
  String seasonId = "";
  PlantingMethod plantingMethod = PlantingMethod.directSow;
  int length = 0;
  int rows = 0;
  int inRowSpacing = 0;
  int daysToPottingUp = 0;
  int daysToTransplant = 0;
  int daysToHarvest = 0;
  int harvestWindow = 0;

  Planting(
      {super.name,
      super.notes,
      this.seasonId = "",
      this.cropId = "",
      this.plantingMethod = PlantingMethod.directSow,
      this.length = 0,
      this.rows = 0,
      this.inRowSpacing = 0,
      this.daysToPottingUp = 0,
      this.daysToTransplant = 0,
      this.daysToHarvest = 0,
      this.harvestWindow = 0})
      : super();

  Planting.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    cropId = data["cropId"];
    seasonId = data["seasonId"];
    length = data["length"];
    rows = data["rows"];
    inRowSpacing = data["inRowSpacing"];
    plantingMethod = PlantingMethod.values
        .firstWhere((e) => e.toString() == data['plantingMethod']);
    daysToPottingUp = data["daysToPottingUp"];
    daysToTransplant = data["daysToTransplant"];
    daysToHarvest = data["daysToHarvest"];
    harvestWindow = data["harvestWindow"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      "cropId": cropId,
      "seasonId": seasonId,
      "length": length,
      "rows": rows,
      "inRowSpacing": inRowSpacing,
      "plantingMethod": plantingMethod.toString(),
      "daysToPottingUp": daysToPottingUp,
      "daysToTransplant": daysToTransplant,
      "daysToHarvest": daysToHarvest,
      "harvestWindow": harvestWindow
    });
    return map;
  }

  @override
  String itemName() {
    return ResourceConstants.planting;
  }
}
