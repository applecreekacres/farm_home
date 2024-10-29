import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

abstract class Resource extends Item {
  String name = "";
  String notes = "";
  String get resourceType => (this).runtimeType.toString();

  Resource({this.name = "", this.notes = ""});

  Resource.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    name = data["name"];
    notes = data["notes"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"name": name, "notes": notes});
    return map;
  }

  @override
  String itemType() {
    return ResourceConstants.title;
  }
}
