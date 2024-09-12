import 'models.dart';

enum LandType { bed, field, landmark, paddock, property, other }

class Land extends Resource {
  LandType _landType;

  Land(List<String> tags, this._landType) : super(tags, (Land).toString());

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"landType": _landType});
    return map;
  }
}
