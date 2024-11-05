import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:farm_home/constants/constants.dart';
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
          padding: EdgeInsets.all(8),
          child: ItemList(
            items: provider.records,
            leading: (item) {
              if (item.isDone) {
                return Icon(Icons.check_box);
              } else {
                return Icon(Icons.check_box_outline_blank);
              }
            },
            title: (data) => Text(data.title),
            subtitle: (data) {
              if (data.notes == "") {
                return null;
              } else {
                return Text(
                    "${data.notes.substring(0, min(20, data.notes.length))}...");
              }
            },
            trailing: (data) => Column(
              children: [
                Text(data.itemName()),
                Text(data.timestamp.toString().substring(0, 10)),
              ],
            ),
            onTap: (data) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordConstants.recordInfo
                      .where((ref) => ref.name == data.itemName())
                      .first
                      .edit(data)!,
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
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ItemInfoList(
                items: RecordConstants.recordInfo,
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
