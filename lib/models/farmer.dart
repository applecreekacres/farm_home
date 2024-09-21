import 'package:farm_home/models/models.dart';

class Farmer extends Item {
  String photoUrl = "";
  String name = "";

  Farmer(this.name, this.photoUrl);

  Farmer.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    name = data["name"];
    photoUrl = data["photoUrl"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"name": name, "photoUrl": photoUrl});
    return map;
  }

  @override
  String itemName() {
    return "Farmer";
  }

  @override
  String itemType() {
    return "User";
  }
}
