import 'package:flutter/material.dart';

import 'package:farm_home/pages/pages.dart';

class FarmHomeDrawer extends StatelessWidget {
  const FarmHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: const Text("User"),
        ),
        ListTile(
          leading: const Icon(Icons.description),
          title: const Text("Records"),
        ),
        ListTile(
          leading: const Icon(Icons.pets),
          title: const Text("Animals"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimalListPage()));
          },
        ),
        ListTile(leading: const Icon(Icons.yard), title: const Text("Plantings")),
        ListTile(leading: const Icon(Icons.language), title: const Text("Land")),
        ListTile(
          leading: const Icon(Icons.snowing),
          title: const Text("Seasons"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SeasonFormPage()));
          },
        )
      ],
    ));
  }
}
