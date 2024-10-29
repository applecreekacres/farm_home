import 'package:farm_home/constants/constants.dart';

import 'models.dart';

abstract class Record extends Item {
  String title = "";
  String notes = "";
  bool isDone = false;
  List<Quantity>? quantities = List<Quantity>.empty();
  DateTime? timestamp = DateTime.now();
  List<String>? tags = List<String>.empty();
  List<String>? resourceIds;

  Future<List<Resource>?> get resources async {
    List<Resource>? records;
    if (resourceIds != null) {
      for (var id in resourceIds!) {
        records.add(await getItemById(id, (data) => ));
      }
    }

    return records;
  }

  Record({
    this.title = "",
    this.timestamp,
    this.notes = "",
    this.isDone = false,
    this.quantities,
    this.tags,
    this.resourceIds,
  }) : super() {
    timestamp ??= DateTime.now();
  }

  Record.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    title = data["title"];
    notes = data["notes"];
    isDone = data["isDone"];
    resourceIds = List<String>.from(data["resourceIds"]);
    quantities = List<Quantity>.from(data["quantities"]);
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
      "resourceIds": resourceIds,
      "timestamp": timestamp?.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemType() {
    return RecordConstants.title;
  }
}
