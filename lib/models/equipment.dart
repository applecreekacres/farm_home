import 'resource.dart';

class Equipment extends Resource {
  String manufacturer = "";
  String model = "";
  String serialNumber = "";

  Equipment(this.manufacturer, this.model, this.serialNumber) : super();

  Equipment.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (data["resourceType"] == resourceType) {
      manufacturer = data["manufacturer"];
      model = data["model"];
      serialNumber = data["serialNumber"];
    } else {
      ArgumentError("Data is not of correct resource type.");
    }
  }

  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({
      "manufacturer": manufacturer,
      "model": model,
      "serialNumber": serialNumber
    });
    return map;
  }
}
