import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:farm_home/data_access.dart';

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

class ItemAccess {
  final DataAccess _dataAccess;
  final SharedPreferences _prefs;

  ItemAccess(this._dataAccess, this._prefs);

  /// Upload an item to Firestore. If the item exists it will be updated.
  void createItem<T extends Item>(T model) async {
    model._userId = _prefs.getString("userId")!;
    model._modified = DateTime.now();
    await _dataAccess.createItem(model._userId, model._id, model.toMap());
  }

  void updateItem<T extends Item>(T model) async {
    model._userId = _prefs.getString("userId")!;
    model._modified = DateTime.now();
    await _dataAccess.updateItem(model._userId, model._id, model.toMap());
  }

  /// Get an item from Firestore with a specific identification.
  ///
  /// Will return [null] if no item by the given ID exists.
  Future<T?> getItemById<T>(
      String itemId, T Function(Map<String, dynamic>) transform) async {
    var user = _prefs.getString("userId");
    if (user != null) {
      var data = await _dataAccess.getItem(user, itemId);
      if (data != null) {
        return transform(data);
      }
    }
    return null;
  }

  Future<List<T>> getItemsByField<T extends Item>(String field, String value,
      T Function(Map<String, dynamic>) transform) async {
    return await getItemsWithFilter(
        [Filter(field, FilterOperator.isEqual, value)], transform);
  }

  Future<List<T>> getItems<T extends Item>(
      String name, T Function(Map<String, dynamic>) transform) async {
    return await getItemsByField<T>("itemName", name, transform);
  }

  Future<List<T>> getItemsByType<T extends Item>(
      String itemType, T Function(Map<String, dynamic>) transform) async {
    return await getItemsByField<T>("itemType", itemType, transform);
  }

  void deleteItem<T extends Item>(String id) async {
    var user = _prefs.getString("userId");
    if (user != null) {
      await _dataAccess.deleteItem(user, id);
    }
  }

  Future<List<T>> getItemsWithFilter<T>(
      List<Filter> query, T Function(Map<String, dynamic>) transform) async {
    var user = _prefs.getString("userId");
    if (user != null) {
      var data = await _dataAccess.getItemsByFilter(user, query);
      return data.map((v) => transform(v)).toList();
    }
    return [];
  }
}
