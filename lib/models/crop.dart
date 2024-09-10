import 'models.dart';

class Crop extends Reference {
  int _daysToPottingUp = 0;
  int _daysToTransplant = 0;
  int _daysToMaturity = 0;
  int _harvestWindow = 0;
  CropFamily _cropFamily;

  int get daysToPottingUp => _daysToPottingUp;

  int get daysToTransplant => _daysToTransplant;

  int get dayToMaturity => _daysToMaturity;

  int get harvestWindow => _harvestWindow;

  CropFamily get cropFamily => _cropFamily;

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

  set cropFamily(CropFamily family) {
    if (family != _cropFamily) {
      _cropFamily = family;
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
}
