import 'models.dart';

abstract class Record extends Item {
  String title = "";
  String notes = "";
  bool isDone = false;
  List<Quantity> quantities = List<Quantity>.empty();
  DateTime? timestamp = DateTime.now();
  List<Resource> resources = List<Resource>.empty();
  List<String> tags = List<String>.empty();

  Record(
      {this.title = "",
      this.timestamp,
      this.notes = "",
      this.isDone = false,
      this.quantities = const [],
      this.resources = const [],
      this.tags = const []})
      : super() {
    timestamp ??= DateTime.now();
  }

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    title = data["title"];
    notes = data["notes"];
    isDone = data["isDone"];
    quantities = List<Quantity>.from(data["quantities"]);
    resources = List<Resource>.from(data["resources"]);
    timestamp = DateTime.fromMillisecondsSinceEpoch(data["timestamp"]);
    tags = List<String>.from(data["tags"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "notes": notes,
      "isDone": isDone,
      "quantities": quantities,
      "recordType": itemName(),
      "resources": resources.map((res) => res.id).toList(),
      "timestamp": timestamp?.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
