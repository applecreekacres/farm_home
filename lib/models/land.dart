import 'models.dart';

enum LandType { bed, field, landmark, paddock, property, other }

class Land extends Resource {
  LandType landType = LandType.other;

  Land(this.landType) : super();

  Land.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    landType = data["landmark"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"landType": landType});
    return map;
  }
}
