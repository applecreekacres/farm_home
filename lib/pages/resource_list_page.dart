import 'package:material_ui/material_ui.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';

class ResourceListPage extends ConsumerStatefulWidget {
  const ResourceListPage({super.key});

  @override
  ConsumerState<ResourceListPage> createState() => _ResourceListPageState();
}

class _ResourceListPageState extends ConsumerState<ResourceListPage> {
  final List<ItemInfo> _filterItems = List.from([
    ItemInfo("All", Icons.all_inclusive, () => null, (item) => null),
  ])..addAll(ResourceConstants.resourceInfo);
  late String _filterName;

  @override
  void initState() {
    _filterName = "All";
    _filterItems.sort((a, b) => a.name.compareTo(b.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resources = ref.watch(resourcesProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(ResourceConstants.titlePlural),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              builder: (BuildContext context) {
                return ItemInfoList(
                  items: _filterItems,
                  onTap: (item) {
                    setState(() {
                      _filterName = item.name;
                      Navigator.pop(context); // close the modal sheet
                    });
                  },
                );
              },
            ),
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      drawer: const FarmHomeDrawer(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ResourceList(
          items: resources,
          filter: (data) {
            if (_filterName == "All") {
              return data;
            } else {
              return data
                  .where((element) => element.itemName() == _filterName)
                  .toList();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            builder: (context) {
              return ItemInfoList(
                items: ResourceConstants.resourceInfo,
                onTap: (item) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item.init()!),
                  );
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
