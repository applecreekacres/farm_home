import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/pages/home.dart';
import 'package:farm_home/providers/record_provider.dart';
import 'package:farm_home/widgets/widgets.dart';

class RecordListPage extends StatefulWidget {
  const RecordListPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecordListPageState();
}

class _RecordListPageState extends State<RecordListPage> {
  final List<ItemInfo> _filterItems = List.from([
    ItemInfo(
      "All",
      Icons.all_inclusive,
      () => null,
      (item) => null,
    )
  ])
    ..addAll(RecordConstants.recordInfo);
  late String _filterName;

  @override
  void initState() {
    _filterName = "All";
    _filterItems.sort((a, b) => a.name.compareTo(b.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecordProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(RecordConstants.titlePlural),
        actions: [
          IconButton(
              onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView.builder(
                      itemCount: _filterItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(_filterItems[index].icon),
                          title: Text(_filterItems[index].name),
                          trailing: _filterName == _filterItems[index].name
                              ? Icon(Icons.check)
                              : null,
                          onTap: () {
                            setState(() {
                              _filterName = _filterItems[index].name;
                              Navigator.pop(context);
                            });
                          },
                        );
                      },
                    );
                  }),
              icon: Icon(Icons.filter_list))
        ],
      ),
      drawer: const FarmHomeDrawer(),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: ItemList(
            items: provider.records,
            title: (data) => Text(data.title),
            trailing: (data) => Text(data.itemName()),
            onTap: (data) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordConstants.recordInfo
                      .where((ref) => ref.name == data.itemName())
                      .first
                      .edit
                      .call(data),
                ),
              );
            },
            filter: (data) {
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
