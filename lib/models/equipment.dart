import 'resource.dart';

class Equipment extends Resource {
  String manufacturer = "";
  String model = "";
  String serialNumber = "";

  Equipment(
      {super.name,
      super.notes,
      this.manufacturer = "",
      this.model = "",
      this.serialNumber = ""});

  Equipment.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (data["resourceType"] == resourceType) {
      manufacturer = data["manufacturer"];
      model = data["model"];
      serialNumber = data["serialNumber"];
    } else {
      ArgumentError("Data is not of correct resource type.");
    }
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      "manufacturer": manufacturer,
      "model": model,
      "serialNumber": serialNumber
    });
    return map;
  }

  @override
  String itemName() {
    return "Equipment";
  }
}
