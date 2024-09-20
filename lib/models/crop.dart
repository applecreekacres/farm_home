import 'models.dart';

class Crop extends Reference {
  int daysToPottingUp = 0;
  int daysToTransplant = 0;
  int daysToMaturity = 0;
  int harvestWindow = 0;
  CropFamily? family;
  String? _cropFamilyId;

  CropFamily? get cropFamily {
    if (_cropFamilyId != null && family == null) {
      family = getItemById<CropFamily>(_cropFamilyId as String) as CropFamily?;
    }
    return family;
  }

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
  String referenceType() {
    return "Crop";
  }
}
