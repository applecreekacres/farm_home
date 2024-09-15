import 'item.dart';

class Resource extends Item {
  String get resourceType => (this).runtimeType.toString();

  Resource();

  Resource.fromMap(super.data) : super.fromMap();

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll({"resource_type": resourceType});
    return map;
  }
}
