import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';
import 'package:farm_home/widgets/widgets.dart';

class ResourceSelectPage extends StatelessWidget {
  const ResourceSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Select Resource"),
      ),
      drawer: const FarmHomeDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
              leading: const Icon(Icons.pets),
              title: const Text("Animal")),
          ListTile(
              leading: const Icon(Icons.agriculture),
              title: const Text("Equipment")),
          ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Land")),
          ListTile(
              leading: const Icon(Symbols.potted_plant),
              title: const Text("Planting")),
          ListTile(
              leading: const Icon(Symbols.psychiatry),
              title: const Text("Seed")),
        ],
      ),
    );
  }
}
