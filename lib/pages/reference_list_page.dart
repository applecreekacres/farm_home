import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/pages/home.dart';
import 'package:farm_home/providers/reference_provider.dart';
import 'package:farm_home/widgets/widgets.dart';

class ReferenceListPage extends StatefulWidget {
  const ReferenceListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReferenceListPageState();
}

class _ReferenceListPageState extends State<ReferenceListPage> {
  final List<ItemInfo> _filterItems =
      List.from([ItemInfo("All", Icons.all_inclusive, () => null)])
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
        title: const Text("References"),
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
            items: refProvider.references,
            title: (data) => Text(data.name),
            trailing: (data) => Text(data.itemName()),
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
