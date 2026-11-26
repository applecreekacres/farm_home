import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/data_access.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordingDataAccess implements DataAccess {
  final List<List<Filter>> calls = [];
  final List<Map<String, dynamic>> rows = [];
  int writes = 0;

  @override
  Future<void> createItem(
    String database,
    String id,
    Map<String, dynamic> data,
  ) async {
    writes++;
    rows.add(data);
  }

  @override
  Future<void> deleteItem(String database, String id) async {}

  @override
  Future<Map<String, dynamic>?> getItem(String database, String id) async =>
      null;

  @override
  Future<List<Map<String, dynamic>>> getItemsByFilter(
    String database,
    List<Filter> filters,
  ) async {
    calls.add(filters);
    return rows;
  }

  @override
  Future<void> updateItem<T extends Item>(
    String database,
    String id,
    Map<String, dynamic> data,
  ) async {}
}

Future<ProviderContainer> openContainer(RecordingDataAccess data) async {
  SharedPreferences.setMockInitialValues({'userId': 'user-1'});
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      dataAccessProvider.overrideWithValue(data),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  test('planting and seed share one cached resource query', () async {
    final data = RecordingDataAccess()
      ..rows.addAll([
        Planting(name: 'Bed').toMap(),
        Seed(name: 'Tomato').toMap(),
      ]);
    final container = await openContainer(data);

    final resources = await container.read(resourcesProvider.future);
    final plantings = container.read(plantingsProvider).requireValue;
    final seeds = container.read(seedsProvider).requireValue;
    await container.read(resourcesProvider.future);

    expect(resources, hasLength(2));
    expect(plantings.single.name, 'Bed');
    expect(seeds.single.name, 'Tomato');
    expect(data.calls, hasLength(1));
    expect(data.calls.single.single.field, 'itemType');
    expect(data.calls.single.single.value, ResourceConstants.title);
  });

  test('saving a resource refreshes the shared list', () async {
    final data = RecordingDataAccess();
    final container = await openContainer(data);

    await container.read(resourcesProvider.future);
    await container
        .read(resourcesProvider.notifier)
        .save(Animal(name: 'Hen'), isNew: true);

    final resources = container.read(resourcesProvider).requireValue;
    expect(data.writes, 1);
    expect(data.calls, hasLength(2));
    expect(resources.single, isA<Animal>());
    expect(resources.single.name, 'Hen');
    expect(container.read(animalsProvider).requireValue.single.name, 'Hen');
  });
}
