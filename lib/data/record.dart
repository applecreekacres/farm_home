import 'item.dart';

class Record extends Item {
  String title = "";
  String description = "";
  bool isDone = false;

  Record(super.id, super.created, super.modified, super.tags, this.title, this.description,
      this.isDone);

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    title = data["title"];
    description = data["description"];
    isDone = data["isDone"];

  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "description": description,
      "isDone": isDone
    };
    map.addAll(super.toMap());
    return map;
  }
}
