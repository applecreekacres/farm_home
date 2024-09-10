import 'package:uuid/uuid.dart';

abstract class Item {
  String _id = const Uuid().v4();
  DateTime _created = DateTime.now();
  DateTime _modified = DateTime.now();
  late List<String> tags;

  Item(this.tags);

  String get id => _id;

  DateTime get created => _created;

  DateTime get modified => _modified;

  void update() {
    _modified = DateTime.now();
  }

  Item.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _created = DateTime.fromMillisecondsSinceEpoch(data["created"]);
    _modified = DateTime.fromMillisecondsSinceEpoch(data["modified"]);
    tags = List<String>.from(data["tags"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "created": _created.millisecondsSinceEpoch,
      "modified": _modified.millisecondsSinceEpoch,
      "tags": tags
    };
  }
}
