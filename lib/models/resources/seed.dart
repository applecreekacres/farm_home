import 'package:farm_home/models/models.dart';

class Seed extends Resource {
  String cropId = "";

  Seed({super.name, super.notes, this.cropId = ""}) : super();

  Seed.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    cropId = data["cropId"];
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
