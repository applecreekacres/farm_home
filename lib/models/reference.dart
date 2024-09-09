import 'models.dart';

class Reference extends Item {
  String name = "";
  String description = "";

  Reference(super.tags, this.name, this.description);

  Reference.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    name = data["name"];
    description = data["description"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"name": name, "description": description};
    map.addAll(super.toMap());
    return map;
  }
}
