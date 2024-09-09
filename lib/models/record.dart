import 'models.dart';

class Record extends Item {
  String title = "";
  String description = "";
  bool isDone = false;
  List<Quantity> quantities = List<Quantity>.empty();
  String recordType = "";
  DateTime timestamp = DateTime.now();
  List<Resource> resources = List<Resource>.empty();

  Record(super.tags, this.title, this.timestamp, this.description, this.isDone,
      this.quantities, this.resources, this.recordType);

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    title = data["title"];
    description = data["description"];
    isDone = data["isDone"];
    quantities = data["quantities"];
    recordType = data["recordType"];
    resources = List<Resource>.from(data["resources"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "description": description,
      "isDone": isDone,
      "quantities": quantities,
      "recordType": recordType,
      "resources": resources
    };
    map.addAll(super.toMap());
    return map;
  }
}
