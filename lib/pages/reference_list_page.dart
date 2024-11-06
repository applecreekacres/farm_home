import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/reference_provider.dart';
import 'package:farm_home/widgets/widgets.dart';

class ReferenceListPage extends StatefulWidget {
  const ReferenceListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReferenceListPageState();
}

class _ReferenceListPageState extends State<ReferenceListPage> {
  final List<ItemInfo> _filterItems = List.from([
    ItemInfo(
      "All",
      Icons.all_inclusive,
      () => null,
      (item) => null,
    )
  ])
    ..addAll(ReferenceConstants.referenceInfo);
  late String _filterName;

  @override
  void initState() {
    _filterName = "All";
    _filterItems.sort((a, b) => a.name.compareTo(b.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(ReferenceConstants.titlePlural),
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
                  }),
              icon: Icon(Icons.filter_list))
        ],
      ),
      drawer: const FarmHomeDrawer(),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: ReferenceList(
            items: refProvider.references,
            filter: (data) {
              data.sort((
                a,
                b,
              ) =>
                  a.name.compareTo(b.name));
              if (_filterName == "All") {
                return data;
              } else {
                return data
                    .where((element) => element.itemName() == _filterName)
                    .toList();
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ItemInfoList(
                items: ReferenceConstants.referenceInfo,
                onTap: (item) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => item.init()!));
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
