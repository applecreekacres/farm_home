import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/data_access.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/resource_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordingDataAccess implements DataAccess {
  final List<List<Filter>> calls = [];

  @override
  Future<void> createItem(
      String database, String id, Map<String, dynamic> data) async {}

  @override
  Future<void> deleteItem(String database, String id) async {}

  @override
  Future<Map<String, dynamic>?> getItem(String database, String id) async =>
      null;

  @override
  Future<List<Map<String, dynamic>>> getItemsByFilter(
      String database, List<Filter> filters) async {
    calls.add(filters);
    return [];
  }

  @override
  Future<void> updateItem<T extends Item>(
      String database, String id, Map<String, dynamic> data) async {}
}

void main() {
  test('planting and seed query their own item names', () async {
    SharedPreferences.setMockInitialValues({'userId': 'user-1'});
    final prefs = await SharedPreferences.getInstance();
    final data = RecordingDataAccess();
    final provider = ResourceProvider(ItemAccess(data, prefs));

    await provider.planting;
    await provider.seed;

    expect(data.calls[0].single.field, 'itemName');
    expect(data.calls[0].single.value, ResourceConstants.planting);
    expect(data.calls[1].single.value, ResourceConstants.seed);
  });
}
