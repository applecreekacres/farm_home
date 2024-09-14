import 'package:flutter/material.dart';
import 'package:farm_home/pages/pages.dart';

class FarmHomeDrawer extends StatelessWidget {
  const FarmHomeDrawer({super.key});

  @override
  Widget build(BuildContext context)
 {
    return Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: const Text("User"),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Records"),
          ),
          ListTile(leading: Icon(Icons.pets), title: Text("Animals")),
          ListTile(leading: Icon(Icons.yard), title: Text("Plantings")),
          ListTile(leading: Icon(Icons.language), title: Text("Land")),
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