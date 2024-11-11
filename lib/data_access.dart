import 'package:farm_home/models/models.dart';

enum FilterOperator {
  isEqual,
  isNotEqual,
  isLessThan,
  isLessThanOrEqual,
  isGreaterThan,
  isGreaterThanOrEqual,
  isNull,
  isNotNull,
  contains
}

class Filter {
  String field;
  Object? value;
  FilterOperator operator;

  Filter(this.field, this.operator, this.value);
}

abstract interface class DataAccess {
  Future<void> createItem(
      String database, String id, Map<String, dynamic> data);

  Future<void> updateItem<T extends Item>(
      String database, String id, Map<String, dynamic> data);

  Future<Map<String, dynamic>?> getItem(String database, String id);

  Future<List<Map<String, dynamic>>> getItemsByFilter(
      String database, List<Filter> filters);

  Future<void> deleteItem(String database, String id);
}
