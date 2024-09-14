import 'models.dart';

class Record extends Item {
  String title = "";
  String notes = "";
  bool isDone = false;
  List<Quantity> quantities = List<Quantity>.empty();
  String recordType = "";
  DateTime timestamp = DateTime.now();
  List<Resource> resources = List<Resource>.empty();
  List<String> tags = List<String>.empty();

  Record(this.title, this.timestamp, this.notes, this.isDone, this.quantities,
      this.resources, this.tags, this.recordType)
      : super();

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    title = data["title"];
    notes = data["notes"];
    isDone = data["isDone"];
    quantities = List<Quantity>.from(data["quantities"]);
    recordType = data["recordType"];
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
      "recordType": recordType,
      "resources": resources.map((res) => res.id).toList(),
      "timestamp": timestamp.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
