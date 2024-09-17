import 'package:farm_home/constants/constants.dart';
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
          decoration: const BoxDecoration(color: ColorConstants.primaryColor),
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
