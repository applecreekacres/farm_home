import 'package:farm_home/constants/constants.dart';

import 'models.dart';

class Crop extends Reference {
  int daysToPottingUp = 0;
  int daysToTransplant = 0;
  int daysToMaturity = 0;
  int harvestWindow = 0;
  CropFamily? family;
  String? _cropFamilyId;

  Future<CropFamily?> get cropFamily async {
    if (_cropFamilyId != null && family == null) {
      family = await getItemById<CropFamily>(_cropFamilyId!, (v) => CropFamily.fromMap(v));
    }
    return family;
  }

  set cropFamilyId(String? id) {
    _cropFamilyId = id;
  }

  String? get cropFamilyId => _cropFamilyId;

  Crop(
      {super.name,
      super.description,
      this.daysToPottingUp = 0,
      this.daysToTransplant = 0,
      this.daysToMaturity = 0,
      this.harvestWindow = 0,
      this.family});

  Crop.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    daysToPottingUp = data["daysToPottingUp"];
    daysToMaturity = data["daysToMaturity"];
    daysToTransplant = data["daysToTransplant"];
    harvestWindow = data["harvestWindow"];
    _cropFamilyId = data["cropFamilyId"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "daysToPottingUp": daysToPottingUp,
      "daysToTransplant": daysToTransplant,
      "daysToMaturity": daysToMaturity,
      "harvestWindow": harvestWindow,
      "cropFamilyId": _cropFamilyId
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return ReferenceConstants.crop;
  }
}
