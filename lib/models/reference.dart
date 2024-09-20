import 'models.dart';

abstract class Reference extends Item {
  String name = "";
  String description = "";

  String referenceType();

  Reference({this.name = "", this.description = ""});

  Reference.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (data["referenceType"] == referenceType) {
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
      "referenceType": referenceType(),
    });
    return map;
  }
}
