import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Based class for pretty much all items that will be used within the app.
/// This contains the base fields that all classes need. An unique ID, a
/// creation timestamp and a modified timestamp.
abstract class Item {
  String _userId = "";
  String _id = const Uuid().v4();
  DateTime _created = DateTime.now();
  DateTime _modified = DateTime.now();

  Item();

  String itemName();

  String itemType();

  /// Unique identifier of every item and derived class that is created.
  String get id => _id;

  /// Timestamp of when the item was created.
  DateTime get created => _created;

  /// Timestamp of when the item was last modified.
  DateTime get modified => _modified;

  String get userId => _userId;

  Item.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _userId = data["userId"];
    _created = DateTime.fromMillisecondsSinceEpoch(data["created"]);
    _modified = DateTime.fromMillisecondsSinceEpoch(data["modified"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "userId": _userId,
      "created": _created.millisecondsSinceEpoch,
      "modified": _modified.millisecondsSinceEpoch,
      "itemName": itemName(),
      "itemType": itemType(),
    };
  }
}

/// Upload an item to Firestore. If the item exists it will be updated.
void createItem<T extends Item>(T model) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  model._userId = prefs.getString("userId") ?? "";
  model._modified = DateTime.now();
  await FirebaseFirestore.instance
      .collection(model._userId)
      .doc(model.id)
      .set(model.toMap());
}

void updateItem<T extends Item>(T model) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  model._userId = prefs.getString("userId") ?? "";
  model._modified = DateTime.now();
  await FirebaseFirestore.instance
      .collection(model._userId)
      .doc(model.id)
      .update(model.toMap());
}
