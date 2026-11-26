import 'package:farm_home/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(recordsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(AppConstants.appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Open Records"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: RecordList(
                items: records,
                filter: (items) {
                  return items
                      .where(
                        (item) =>
                            (item.isDone == false &&
                            item.timestamp!.isAfter(DateTime.now())),
                      )
                      .toList();
                },
              ),
            ),
            const Text("Overdue Records"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: RecordList(
                items: records,
                filter: (items) {
                  return items
                      .where(
                        (item) =>
                            (item.isDone == false &&
                            item.timestamp!.isBefore(DateTime.now())),
                      )
                      .toList();
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const FarmHomeDrawer(),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              builder: (BuildContext context) {
                return RecordSelectWidget();
              },
            ),
            icon: const Icon(Icons.task),
          ),
          ActionButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              builder: (BuildContext context) {
                return ResourceSelectWidget();
              },
            ),
            icon: const Icon(Icons.yard),
          ),
          ActionButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              builder: (BuildContext context) {
                return ReferenceSelectWidget();
              },
            ),
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
