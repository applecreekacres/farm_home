import 'item.dart';

class Resource extends Item {
  String _resourceType = "";

  Resource(this._resourceType) : super();

  Resource.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _resourceType = data["resource_type"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"resource_type": _resourceType};
    map.addAll(super.toMap());
    return map;
  }
}
