import 'package:flutter/material.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(AppConstants.appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          const Text("Open Records"),
        ],),
      ),
      drawer: const FarmHomeDrawer(),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const RecordSelectWidget();
                }),
            icon: const Icon(Icons.task),
          ),
          ActionButton(
            onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const ResourceSelectWidget();
                }),
            icon: const Icon(Icons.yard),
          ),
          ActionButton(
            onPressed: () => showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return ReferenceSelectWidget();
                }),
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
