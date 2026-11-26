import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/records_provider.dart';
import 'package:farm_home/providers/references_provider.dart';
import 'package:farm_home/providers/resources_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ItemCommands on WidgetRef {
  Future<void> saveItem(Item item, {required bool isNew}) {
    return switch (item) {
      Resource resource => read(
        resourcesProvider.notifier,
      ).save(resource, isNew: isNew),
      Reference reference => read(
        referencesProvider.notifier,
      ).save(reference, isNew: isNew),
      Record record => read(
        recordsProvider.notifier,
      ).save(record, isNew: isNew),
      _ => Future<void>.error(ArgumentError('Cannot save ${item.runtimeType}')),
    };
  }

  Future<void> deleteItem(Item item) {
    return switch (item) {
      Resource() => read(resourcesProvider.notifier).remove(item.id),
      Reference() => read(referencesProvider.notifier).remove(item.id),
      Record() => read(recordsProvider.notifier).remove(item.id),
      _ => Future<void>.error(
        ArgumentError('Cannot delete ${item.runtimeType}'),
      ),
    };
  }
}
