import 'models.dart';

class Crop extends Reference {
  int _daysToPottingUp = 0;
  int _daysToTransplant = 0;
  int _daysToMaturity = 0;
  int _harvestWindow = 0;
  CropFamily? _cropFamily;
  String? _cropFamilyId;

  int get daysToPottingUp => _daysToPottingUp;

  int get daysToTransplant => _daysToTransplant;

  int get dayToMaturity => _daysToMaturity;

  int get harvestWindow => _harvestWindow;

  CropFamily? get cropFamily {
    if (_cropFamilyId != null) {
      return getItemById((CropFamily).toString(), _cropFamilyId as String)
          as CropFamily?;
    }
    return null;
  }

  set daysToPottingUp(int days) {
    if (days != _daysToPottingUp) {
      _daysToPottingUp = days;
      update();
    }
  }

  set daysToTransplant(int days) {
    if (days != _daysToTransplant) {
      _daysToTransplant = days;
      update();
    }
  }

  set daysToMaturity(int days) {
    if (days != _daysToMaturity) {
      _daysToMaturity = days;
      update();
    }
  }

  set harvestWindow(int days) {
    if (days != _harvestWindow) {
      _harvestWindow = days;
      update();
    }
  }

  set cropFamily(CropFamily? family) {
    if (family != _cropFamily) {
      _cropFamily = family;
      _cropFamilyId = family?.id;
      update();
    }
  }

  Crop(
      super.tags,
      super.name,
      super.description,
      this._daysToPottingUp,
      this._daysToTransplant,
      this._daysToMaturity,
      this._harvestWindow,
      this._cropFamily);

  Crop.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _daysToPottingUp = data["daysToPottingUp"];
    _daysToMaturity = data["daysToMaturity"];
    _daysToTransplant = data["daysToTransplant"];
    _cropFamilyId = data["cropFamilyId"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "daysToPottingUp": _daysToPottingUp,
      "daysToTransplant": _daysToTransplant,
      "daysToMaturity": _daysToMaturity,
      "harvestWindow": _harvestWindow,
      "cropFamilyId": _cropFamilyId
    };
    map.addAll(super.toMap());
    return map;
  }
}
