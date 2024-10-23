import 'package:farm_home/pages/reference_list_page.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/pages/pages.dart';
import 'package:material_symbols_icons/symbols.dart';

class FarmHomeDrawer extends StatelessWidget {
  const FarmHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: const Text("User"),
        ),
        ListTile(
          leading: const Icon(Symbols.house),
          title: const Text("Home"),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.abc),
          title: const Text("References"),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ReferenceListPage()));
          },
        ),
        Divider(),
        ListTile(
          leading: const Icon(Icons.pets),
          title: const Text("Animals"),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const AnimalListPage()));
          },
        ),
      ],
    ));
  }
}
