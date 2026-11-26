import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/item_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final referencesProvider =
    AsyncNotifierProvider<ReferencesNotifier, List<Reference>>(
      ReferencesNotifier.new,
    );

final cropFamiliesProvider = Provider<AsyncValue<List<CropFamily>>>((ref) {
  return itemsOfType<Reference, CropFamily>(ref.watch(referencesProvider));
});

final cropsProvider = Provider<AsyncValue<List<Crop>>>((ref) {
  return itemsOfType<Reference, Crop>(ref.watch(referencesProvider));
});

final animalSpeciesProvider = Provider<AsyncValue<List<AnimalSpecies>>>((ref) {
  return itemsOfType<Reference, AnimalSpecies>(ref.watch(referencesProvider));
});

final unitsProvider = Provider<AsyncValue<List<Unit>>>((ref) {
  return itemsOfType<Reference, Unit>(ref.watch(referencesProvider));
});

final seasonsProvider = Provider<AsyncValue<List<Season>>>((ref) {
  return itemsOfType<Reference, Season>(ref.watch(referencesProvider));
});

final materialTypesProvider = Provider<AsyncValue<List<MaterialType>>>((ref) {
  return itemsOfType<Reference, MaterialType>(ref.watch(referencesProvider));
});

final recordCategoriesProvider = Provider<AsyncValue<List<RecordCategory>>>((
  ref,
) {
  return itemsOfType<Reference, RecordCategory>(ref.watch(referencesProvider));
});

class ReferencesNotifier extends ItemListNotifier<Reference> {
  @override
  String get collectionType => ReferenceConstants.title;

  @override
  Reference? Function(Map<String, dynamic> data) get decode => (data) {
    final item = initReferenceByItemName(data);
    return item is Reference ? item : null;
  };
}
