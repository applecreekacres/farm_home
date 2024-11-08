import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/item.dart';
import 'package:farm_home/models/records/records.dart';
import 'package:farm_home/models/references/references.dart';
import 'package:farm_home/models/resources/resources.dart';

export 'resources/resources.dart';
export 'references/references.dart';
export 'records/records.dart';
export 'item.dart';

/// Get an item from Firestore with a specific identification.
///
/// Will return [null] if no item by the given ID exists.
Future<T?> getItemById<T>(
    String itemId, T Function(Map<String, dynamic>) transform) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString("userId");
  if (user != null) {
    final docRef = FirebaseFirestore.instance.collection(user).doc(itemId);
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      return transform(docSnapshot.data()!);
    }
  }
  return null;
}

Future<List<T>> getItemsWithQuery<T>(
    Query<Map<String, dynamic>> Function(
            CollectionReference<Map<String, dynamic>>)
        query,
    T Function(Map<String, dynamic>) transform) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString("userId");
  if (user != null) {
    final docRef = query(FirebaseFirestore.instance.collection(user));
    final docSnapshot = await docRef.get();
    final itemList = docSnapshot.docs.map((doc) => doc.data()).toList();
    return itemList.map((v) => transform(v)).toList();
  }
  return [];
}

Future<List<T>> getItemsByField<T extends Item>(String field, String value,
    T Function(Map<String, dynamic>) transform) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString("userId");
  if (user != null) {
    final docRef = FirebaseFirestore.instance
        .collection(user)
        .where(field, isEqualTo: value);
    final docSnapshot = await docRef.get();
    final itemList = docSnapshot.docs.map((doc) => doc.data()).toList();
    return itemList.map((v) => transform(v)).toList();
  }
  return [];
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
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString("userId");
  if (user != null) {
    await FirebaseFirestore.instance.collection(user).doc(id).delete();
  }
}

dynamic initRecordByItemName(Map<String, dynamic> data) {
  switch (data["itemName"]) {
    case RecordConstants.activity:
      return ActivityRecord.fromMap(data);
    case RecordConstants.harvest:
      return HarvestRecord.fromMap(data);
    case RecordConstants.input:
      return InputRecord.fromMap(data);
    case RecordConstants.maintenance:
      return MaintenanceRecord.fromMap(data);
    case RecordConstants.observation:
      return ObservationRecord.fromMap(data);
    case RecordConstants.pottingUp:
      return PottingUpRecord.fromMap(data);
    case RecordConstants.purchase:
      return PurchaseRecord.fromMap(data);
    case RecordConstants.sale:
      return SaleRecord.fromMap(data);
    case RecordConstants.seeding:
      return SeedingRecord.fromMap(data);
    case RecordConstants.transplant:
      return TransplantRecord.fromMap(data);
    default:
      throw Error();
  }
}

dynamic initReferenceByItemName(Map<String, dynamic> data) {
  switch (data["itemName"]) {
    case ReferenceConstants.animalSpecies:
      return AnimalSpecies.fromMap(data);
    case ReferenceConstants.crop:
      return Crop.fromMap(data);
    case ReferenceConstants.cropFamily:
      return CropFamily.fromMap(data);
    case ReferenceConstants.materialType:
      return MaterialType.fromMap(data);
    case ReferenceConstants.season:
      return Season.fromMap(data);
    case ReferenceConstants.unit:
      return Unit.fromMap(data);
    case ReferenceConstants.recordCategory:
      return RecordCategory.fromMap(data);
    default:
      throw Error();
  }
}

dynamic initResourceByItemName(Map<String, dynamic> data) {
  switch (data["itemName"]) {
    case ResourceConstants.animal:
      return Animal.fromMap(data);
    case ResourceConstants.equipment:
      return Equipment.fromMap(data);
    case ResourceConstants.land:
      return Land.fromMap(data);
    case ResourceConstants.material:
      return Material.fromMap(data);
    case ResourceConstants.planting:
      return Planting.fromMap(data);
    case ResourceConstants.seed:
      return Seed.fromMap(data);
    default:
      throw Error();
  }
}
