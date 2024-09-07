import 'package:farm_home/models/quantity.dart';

import 'item.dart';

class Record extends Item {
  String title = "";
  String description = "";
  bool isDone = false;
  List<Quantity> quantities = List<Quantity>.empty();

  Record(super.id, super.created, super.modified, super.tags, this.title,
      this.description, this.isDone, this.quantities);

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    title = data["title"];
    description = data["description"];
    isDone = data["isDone"];
    quantities = data["quantities"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "description": description,
      "isDone": isDone,
      "quantities": quantities
    };
    map.addAll(super.toMap());
    return map;
  }
}
