import 'package:farm_home/models/models.dart';

class Seed extends Resource {
  String cropId = "";

  Seed({super.name, super.notes, this.cropId = ""}) : super();

  Seed.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    cropId = data["cropId"];
  }

  Future<Crop?> get crop async {
    if (cropId != "") {
      return getItemById<Crop>(cropId, (data) => Crop.fromMap(data));
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"cropId": cropId});
    return map;
  }

  @override
  String itemName() {
    return "Seed";
  }
}
