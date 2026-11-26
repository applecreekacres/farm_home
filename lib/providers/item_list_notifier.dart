import 'package:farm_home/data_access.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/item_access_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Loads one item collection once, then refreshes that cache after a write.
abstract class ItemListNotifier<I extends Item> extends AsyncNotifier<List<I>> {
  String get collectionType;

  I? Function(Map<String, dynamic> data) get decode;

  @override
  Future<List<I>> build() {
    return _load(ref.watch(itemAccessProvider));
  }

  Future<void> save(I item, {required bool isNew}) async {
    final access = ref.read(itemAccessProvider);
    if (isNew) {
      await access.createItem(item);
    } else {
      await access.updateItem(item);
    }
    await _reload(access);
  }

  Future<void> remove(String id) async {
    final access = ref.read(itemAccessProvider);
    await access.deleteItem(id);
    await _reload(access);
  }

  Future<List<I>> _load(ItemAccess access) async {
    final rows = await access.getItemsWithFilter<I?>([
      Filter('itemType', FilterOperator.isEqual, collectionType),
    ], decode);
    return rows.whereType<I>().toList();
  }

  Future<void> _reload(ItemAccess access) async {
    final next = await AsyncValue.guard(() => _load(access));
    if (ref.mounted) {
      state = next;
    }
  }
}

AsyncValue<List<T>> itemsOfType<S, T>(AsyncValue<List<S>> source) {
  return source.whenData((items) => items.whereType<T>().toList());
}
