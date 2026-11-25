import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

abstract class Record extends Item {
  String title = "";
  String notes = "";
  bool isDone = false;
  List<Quantity> quantities;
  DateTime? timestamp;
  List<String> tags;
  List<String> resourceIds;
  String categoryId = "";

  Record({
    this.title = "",
    DateTime? timestamp,
    this.notes = "",
    this.isDone = false,
    List<Quantity> quantities = const [],
    List<String> tags = const [],
    List<String> resourceIds = const [],
  })  : timestamp = timestamp ?? DateTime.now(),
        quantities = List<Quantity>.of(quantities),
        tags = List<String>.of(tags),
        resourceIds = List<String>.of(resourceIds),
        super();

  Record.fromMap(Map<String, dynamic> data)
      : quantities = _quantitiesFrom(data["quantities"]),
        tags = List<String>.from(data["tags"]),
        resourceIds = List<String>.from(data["resourceIds"]),
        timestamp = DateTime.fromMillisecondsSinceEpoch(data["timestamp"]),
        super.fromMap(data) {
    title = data["title"];
    notes = data["notes"];
    isDone = data["isDone"];
    if (data.containsKey("categoryId")) {
      categoryId = data["categoryId"];
    } else {
      categoryId = "";
    }
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "title": title,
      "notes": notes,
      "isDone": isDone,
      "quantities": quantities.map((quantity) => quantity.toMap()).toList(),
      "recordType": itemName(),
      "resourceIds": resourceIds,
      "timestamp": timestamp?.millisecondsSinceEpoch,
      "tags": tags,
      "categoryId": categoryId,
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemType() {
    return RecordConstants.title;
  }
}

List<Quantity> _quantitiesFrom(dynamic raw) {
  if (raw is! List) {
    return <Quantity>[];
  }
  return raw
      .map((entry) =>
          Quantity.fromMap(Map<String, dynamic>.from(entry as Map)))
      .toList();
}
