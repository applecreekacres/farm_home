import 'package:cloud_firestore/cloud_firestore.dart' hide Filter;
import 'package:farm_home/data_access.dart';
import 'package:farm_home/models/item.dart';

class FirebaseAccess implements DataAccess {
  FirebaseFirestore instance;

  FirebaseAccess(this.instance);

  @override
  Future<void> createItem(
      String database, String id, Map<String, dynamic> data) async {
    await instance.collection(database).doc(id).set(data);
  }

  @override
  Future<void> deleteItem(String database, String id) async {
    await instance.collection(database).doc(id).delete();
  }

  @override
  Future<Map<String, dynamic>?> getItem(String database, String id) async {
    final snapshot = await instance.collection(database).doc(id).get();
    return snapshot.data();
  }

  @override
  Future<List<Map<String, dynamic>>> getItemsByFilter(
      String database, List<Filter> filters) async {
    var query = instance.collection(database) as Query<Map<String, dynamic>>;

    for (var filter in filters) {
      query = _where(filter, query);
    }

    var data = await query.get();
    return data.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<void> updateItem<T extends Item>(
      String database, String id, Map<String, dynamic> data) async {
    await instance.collection(database).doc(id).update(data);
  }

  Query<Map<String, dynamic>> _where(
      Filter filter, Query<Map<String, dynamic>> query) {
    switch (filter.operator) {
      case FilterOperator.isEqual:
        return query.where(filter.field, isEqualTo: filter.value);
      case FilterOperator.isNotEqual:
        return query.where(filter.field, isNotEqualTo: filter.value);
      case FilterOperator.isLessThan:
        return query.where(filter.field, isLessThan: filter.value);
      case FilterOperator.isLessThanOrEqual:
        return query.where(filter.field, isLessThanOrEqualTo: filter.value);
      case FilterOperator.isGreaterThan:
        return query.where(filter.field, isGreaterThan: filter.value);
      case FilterOperator.isGreaterThanOrEqual:
        return query.where(filter.field, isGreaterThanOrEqualTo: filter.value);
      case FilterOperator.isNull:
        return query.where(filter.field, isNull: true);
      case FilterOperator.isNotNull:
        return query.where(filter.field, isNull: false);
      case FilterOperator.contains:
        return query.where(filter.field, arrayContains: filter.value);
    }
  }
}
