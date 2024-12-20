import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class Crop extends Reference {
  int daysToPottingUp = 0;
  int daysToTransplant = 0;
  int daysToMaturity = 0;
  int harvestWindow = 0;
  CropFamily? family;
  String cropFamilyId = "";

  Crop(
      {super.name,
      super.description,
      this.daysToPottingUp = 0,
      this.daysToTransplant = 0,
      this.daysToMaturity = 0,
      this.harvestWindow = 0,
      this.cropFamilyId = ""});

  Crop.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    daysToPottingUp = data["daysToPottingUp"];
    daysToMaturity = data["daysToMaturity"];
    daysToTransplant = data["daysToTransplant"];
    harvestWindow = data["harvestWindow"];
    cropFamilyId = data["cropFamilyId"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "daysToPottingUp": daysToPottingUp,
      "daysToTransplant": daysToTransplant,
      "daysToMaturity": daysToMaturity,
      "harvestWindow": harvestWindow,
      "cropFamilyId": cropFamilyId
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return ReferenceConstants.crop;
  }
}
