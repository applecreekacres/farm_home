import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

/// Based class for pretty much all items that will be used within the app.
/// This contains the base fields that all classes need. An unique ID, a
/// creation timestamp and a modified timestamp.
class Item {
  String _id = const Uuid().v4();
  DateTime _created = DateTime.now();
  DateTime _modified = DateTime.now();
  late List<String> tags;

  Item(this.tags);

  /// Unique identifier of every item and derived class that is created.
  String get id => _id;

  /// Timestamp of when the item was created.
  DateTime get created => _created;

  /// Timestamp of when the item was last modified.
  DateTime get modified => _modified;

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

/// Get an item from Firestore with a specific identification.
///
/// Will return [null] if no item by the given ID exists.
Future<T?> getItemById<T extends Item>(String itemId) async {
  final docRef =
      FirebaseFirestore.instance.collection((T).toString()).doc(itemId);
  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    return Item.fromMap(docSnapshot.data()!) as T;
  } else {
    return null;
  }
}

/// Upload an item to Firestore. If the item exists it will be updated.
void updateItem<T extends Item>(T model) async {
  model._modified = DateTime.now();
  await FirebaseFirestore.instance
      .collection((T).toString())
      .doc(model.id)
      .set(model.toMap());
}
