import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/pages/record_select.dart';
import 'package:farm_home/pages/reference_select.dart';
import 'package:farm_home/pages/resource_select.dart';
import 'package:flutter/material.dart';
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
      body: const Center(),
      drawer: const FarmHomeDrawer(),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RecordSelectPage())),
            icon: const Icon(Icons.task),
          ),
          ActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ResourceSelectPage())),
            icon: const Icon(Icons.yard),
          ),
          ActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ReferenceSelectPage())),
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
