import 'models.dart';

class Record extends Item {
  String? title = "";
  String? notes = "";
  bool? isDone = false;
  List<Quantity>? quantities = List<Quantity>.empty();
  DateTime? timestamp = DateTime.now();
  List<Resource>? resources = List<Resource>.empty();
  List<String>? tags = List<String>.empty();

  String get recordType => (this).runtimeType.toString();

  Record(
      {this.title,
      this.timestamp,
      this.notes,
      this.isDone,
      this.quantities,
      this.resources,
      this.tags})
      : super();

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    var received = data['recordType'] as String;
    if (received == recordType) {
      title = data["title"];
      notes = data["notes"];
      isDone = data["isDone"];
      quantities = List<Quantity>.from(data["quantities"]);
      resources = List<Resource>.from(data["resources"]);
      timestamp = DateTime.fromMillisecondsSinceEpoch(data["timestamp"]);
      tags = List<String>.from(data["tags"]);
    } else {
      throw ArgumentError(
          "Data provided is of invalid record type. Received $received and expected $recordType");
    }
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "notes": notes,
      "isDone": isDone,
      "quantities": quantities,
      "recordType": recordType,
      "resources": resources?.map((res) => res.id).toList(),
      "timestamp": timestamp?.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }
}
