import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Item {
  String _id = const Uuid().v4();
  DateTime _created = DateTime.now();
  DateTime _modified = DateTime.now();
  late List<String> tags;

  Item(this.tags);

  String get id => _id;

  DateTime get created => _created;

  DateTime get modified => _modified;

  void update() {
    _modified = DateTime.now();
  }

  Item.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _created = DateTime.fromMillisecondsSinceEpoch(data["created"]);
    _modified = DateTime.fromMillisecondsSinceEpoch(data["modified"]);
    tags = List<String>.from(data["tags"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "created": _created.millisecondsSinceEpoch,
      "modified": _modified.millisecondsSinceEpoch,
      "tags": tags
    };
  }
}

Future<T?> getItemById<T extends Item>(String itemId) async {
  final docRef = FirebaseFirestore.instance.collection((T).toString()).doc(itemId);
  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    return Item.fromMap(docSnapshot.data()!) as T;
  } else {
    return null;
  }
}

void updateItem<T extends Item>(T model) async {
  model._modified = DateTime.now();
  await FirebaseFirestore.instance
      .collection((T).toString())
      .doc(model.id)
      .set(model.toMap());
}
