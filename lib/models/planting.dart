import 'models.dart';

class Planting extends Resource {
  String _cropId = "";
  List<String> _bedsId = List<String>.empty();
  late Crop? _crop;
  late List<Land> _beds;
  late int length;
  late int rows;
  late int inRowSpacing;
  late int daysToPottingUp;
  late int daysToTransplant;
  late int daysToHarvest;
  late int harvestWindow;

  Crop? get crop {
    if (_cropId != "" && _crop == null) {
      _crop = getItemById<Crop>(_cropId as String) as Crop;
    }
    return _crop;
  }

  set crop(Crop? c) {
    _crop = c;
    if (c != null) {
      _cropId = c.id;
    }
  }

  List<Land> get beds {
    if (_bedsId.isNotEmpty && _beds.isNotEmpty) {
      for (var id in _bedsId) {
        _beds.add(getItemById<Land>(id) as Land);
      }
    }
    return _beds;
  }

  set beds(List<Land> b) {
    beds = b;
    _bedsId = b.map((m) => m.id).toList();
  }

  Planting(
      this._crop,
      this._beds,
      this.length,
      this.rows,
      this.inRowSpacing,
      this.daysToPottingUp,
      this.daysToTransplant,
      this.daysToHarvest,
      this.harvestWindow)
      : super();

  Planting.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _cropId = data["cropId"];
    _bedsId = data["bedsId"];
    length = data["length"];
    rows = data["rows"];
    inRowSpacing = data["inRowSpacing"];
    daysToPottingUp = data["daysToPottingUp"];
    daysToTransplant = data["daysToTransplant"];
    daysToHarvest = data["daysToHarvest"];
    harvestWindow = data["harvestWindow"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      "cropId": _crop?.id,
      "bedsId": _beds.map((obj) => obj.id).toList(),
      "length": length,
      "rows": rows,
      "inRowSpacing": inRowSpacing,
      "daysToPottingUp": daysToPottingUp,
      "daysToTransplant": daysToTransplant,
      "daysToHarvest": daysToHarvest,
      "harvestWindow": harvestWindow
    });
    return map;
  }
}
