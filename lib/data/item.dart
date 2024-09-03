abstract class Item {
  late int id;
  late DateTime created;
  late DateTime modified;
  late List<String> tags;

  Item(this.id, this.created, this.modified, this.tags);

  Item.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    created = data["created"];
    modified = data["modified"];
    tags = data["tags"];
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "created": created, "modified": modified, "tags": tags};
  }
}
