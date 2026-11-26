import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/item_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resourcesProvider =
    AsyncNotifierProvider<ResourcesNotifier, List<Resource>>(
      ResourcesNotifier.new,
    );

final animalsProvider = Provider<AsyncValue<List<Animal>>>((ref) {
  return itemsOfType<Resource, Animal>(ref.watch(resourcesProvider));
});

final equipmentProvider = Provider<AsyncValue<List<Equipment>>>((ref) {
  return itemsOfType<Resource, Equipment>(ref.watch(resourcesProvider));
});

final landProvider = Provider<AsyncValue<List<Land>>>((ref) {
  return itemsOfType<Resource, Land>(ref.watch(resourcesProvider));
});

final materialsProvider = Provider<AsyncValue<List<Material>>>((ref) {
  return itemsOfType<Resource, Material>(ref.watch(resourcesProvider));
});

final plantingsProvider = Provider<AsyncValue<List<Planting>>>((ref) {
  return itemsOfType<Resource, Planting>(ref.watch(resourcesProvider));
});

final seedsProvider = Provider<AsyncValue<List<Seed>>>((ref) {
  return itemsOfType<Resource, Seed>(ref.watch(resourcesProvider));
});

final structuresProvider = Provider<AsyncValue<List<Structure>>>((ref) {
  return itemsOfType<Resource, Structure>(ref.watch(resourcesProvider));
});

class ResourcesNotifier extends ItemListNotifier<Resource> {
  @override
  String get collectionType => ResourceConstants.title;

  @override
  Resource? Function(Map<String, dynamic> data) get decode => (data) {
    final item = initResourceByItemName(data);
    return item is Resource ? item : null;
  };
}
