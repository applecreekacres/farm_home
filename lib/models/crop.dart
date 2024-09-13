import 'models.dart';

class Crop extends Reference {
  int daysToPottingUp = 0;
  int daysToTransplant = 0;
  int daysToMaturity = 0;
  int harvestWindow = 0;
  CropFamily? _cropFamily;
  String? _cropFamilyId;

  CropFamily? get cropFamily {
    if (_cropFamilyId != null && _cropFamily == null) {
      _cropFamily =
          getItemById<CropFamily>(_cropFamilyId as String) as CropFamily?;
    }
    return _cropFamily;
  }

  Crop(
      super.tags,
      super.name,
      super.description,
      this.daysToPottingUp,
      this.daysToTransplant,
      this.daysToMaturity,
      this.harvestWindow,
      this._cropFamily);

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
}
