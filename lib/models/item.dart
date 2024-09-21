import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// Unique identifier of every item and derived class that is created.
  String get id => _id;

  /// Timestamp of when the item was created.
  DateTime get created => _created;

  /// Timestamp of when the item was last modified.
  DateTime get modified => _modified;

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
      "modified": _modified.millisecondsSinceEpoch
    };
  }
}

/// Get an item from Firestore with a specific identification.
///
/// Will return [null] if no item by the given ID exists.
Future<Map<String, dynamic>?> getItemById(
    String collection, String itemId) async {
  final docRef = FirebaseFirestore.instance.collection(collection).doc(itemId);
  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    return docSnapshot.data()!;
  } else {
    return null;
  }
}

Future<List<Map<String, dynamic>>> getItemsByUser(
    String collection) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString("userId");
  final docRef = FirebaseFirestore.instance
      .collection(collection)
      .where('userId', isEqualTo: user);
  final docSnapshot = await docRef.get();
  final itemList = docSnapshot.docs.map((doc) => doc.data()).toList();
  return itemList;
}

/// Upload an item to Firestore. If the item exists it will be updated.
void createItem<T extends Item>(T model) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  model._userId = prefs.getString("userId") ?? "";
  model._modified = DateTime.now();
  await FirebaseFirestore.instance
      .collection(model.itemName())
      .doc(model.id)
      .set(model.toMap());
}

void updateItem<T extends Item>(T model) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  model._userId = prefs.getString("userId") ?? "";
  model._modified = DateTime.now();
  await FirebaseFirestore.instance
      .collection((T as Item).itemName())
      .doc(model.id)
      .update(model.toMap());
}

void deleteItem<T extends Item>(String id) async {
  await FirebaseFirestore.instance
      .collection((T as Item).itemName())
      .doc(id)
      .delete();
}
