import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/item_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recordsProvider = AsyncNotifierProvider<RecordsNotifier, List<Record>>(
  RecordsNotifier.new,
);

final activitiesProvider = Provider<AsyncValue<List<ActivityRecord>>>((ref) {
  return itemsOfType<Record, ActivityRecord>(ref.watch(recordsProvider));
});

class RecordsNotifier extends ItemListNotifier<Record> {
  @override
  String get collectionType => RecordConstants.title;

  @override
  Record? Function(Map<String, dynamic> data) get decode => (data) {
    final item = initRecordByItemName(data);
    return item is Record ? item : null;
  };
}
