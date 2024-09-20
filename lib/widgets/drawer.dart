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
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: const Text("User"),
        ),
      ],
    ));
  }
}
