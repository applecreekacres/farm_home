import 'package:farm_home/constants/constants.dart';

import 'models.dart';

abstract class Reference extends Item {
  String name = "";
  String description = "";

  Reference({this.name = "", this.description = ""});

  Reference.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (data["itemName"] == itemName()) {
      name = data["name"];
      description = data["description"];
    } else {
      throw ArgumentError("Invalid reference data map provided.");
    }
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      "name": name,
      "description": description,
      "itemName": itemName(),
    });
    return map;
  }

  @override
  String itemType() {
    return ReferenceConstants.title;
  }
}
