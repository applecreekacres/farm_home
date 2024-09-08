import 'package:uuid/uuid.dart';

abstract class Item {
  String _id = const Uuid().v4();
  DateTime _created = DateTime.now();
  DateTime _modified = DateTime.now();
  late List<String> tags;

  Item(this.tags);

  void update() {
    _modified = DateTime.now();
  }

  Item.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _created = data["created"];
    _modified = data["modified"];
    tags = data["tags"];
  }

  Map<String, dynamic> toMap() {
    return {"id": _id, "created": _created, "modified": _modified, "tags": tags};
  }
}
