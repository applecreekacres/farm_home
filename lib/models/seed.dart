import 'crop.dart';
import 'resource.dart';

class Seed extends Resource {
  Crop? crop;
  String? _cropId;

  Seed({super.name, super.notes, this.crop}) : super();

  Seed.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _cropId = data["cropId"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"cropId": _cropId});
    return map;
  }

  @override
  String itemName() {
    return "Seed";
  }
}
