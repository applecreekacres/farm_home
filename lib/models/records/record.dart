import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

abstract class Record extends Item {
  String title = "";
  String notes = "";
  bool isDone = false;
  List<Quantity> quantities = List<Quantity>.empty();
  DateTime? timestamp = DateTime.now();
  List<String> tags = List<String>.empty();
  List<String> resourceIds = List<String>.empty();

  Future<List<dynamic>> get resources async {
    List<dynamic> records = [];
    for (var id in resourceIds) {
      var data = await getItemById(id, (data) => data);
      if (data != null) {
        records.add(initResourceByItemName(data));
      }
    }

    return records;
  }

  Record({
    this.title = "",
    this.timestamp,
    this.notes = "",
    this.isDone = false,
    this.quantities = const [],
    this.tags = const [],
    this.resourceIds = const [],
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
