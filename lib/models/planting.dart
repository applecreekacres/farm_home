import 'models.dart';

class Planting extends Resource {
  String _cropId = "";
  List<String> _bedsId = List<String>.empty();
  String _seasonId = "";
  late Season? season;
  late Crop? crop;
  late List<Land>? beds;
  late int length;
  late int rows;
  late int inRowSpacing;
  late int daysToPottingUp;
  late int daysToTransplant;
  late int daysToHarvest;
  late int harvestWindow;

  Planting(
      {super.name,
      super.notes,
      this.crop,
      this.beds,
      this.season,
      this.length = 0,
      this.rows = 0,
      this.inRowSpacing = 0,
      this.daysToPottingUp = 0,
      this.daysToTransplant = 0,
      this.daysToHarvest = 0,
      this.harvestWindow = 0})
      : super();

  Planting.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _cropId = data["cropId"];
    _bedsId = data["bedsId"];
    _seasonId = data["seasonId"];
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
      "cropId": _cropId,
      "bedsId": _bedsId,
      "seasonId": _seasonId,
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

  @override
  String itemName() {
    return "Planting";
  }
}
