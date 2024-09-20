import 'item.dart';

class Resource extends Item {
  String name = "";
  String notes = "";
  String get resourceType => (this).runtimeType.toString();

  Resource({this.name = "", this.notes = ""});

  Resource.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (resourceType == data["resourceType"]) {
      notes = data["notes"];
    } else {
      ArgumentError("Invalid data mapping resource type provided.");
    }
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"resource_type": resourceType, "notes": notes});
    return map;
  }
}
