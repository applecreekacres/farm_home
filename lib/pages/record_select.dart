import 'package:flutter/material.dart';

import 'package:farm_home/pages/pages.dart';
import 'package:farm_home/widgets/widgets.dart';

class RecordSelectPage extends StatelessWidget {
  const RecordSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Select Record"),
      ),
      drawer: const FarmHomeDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.accessibility_new_rounded),
            title: const Text("Activity"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActivityRecordForm()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text("Harvest"),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text("Input"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InputRecordForm()));
            },
          ),
          ListTile(
              leading: Icon(Icons.construction), title: Text("Maintenance")),
          ListTile(
            leading: const Icon(Icons.snowing),
            title: const Text("Observation"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ObservationRecordForm()));
            },
          ),
          ListTile(leading: Icon(Icons.yard), title: Text("Potting Up")),
          ListTile(leading: Icon(Icons.money), title: Text("Purchase")),
          ListTile(
              leading: Icon(Icons.currency_exchange_rounded),
              title: Text("Sale")),
          ListTile(leading: Icon(Icons.yard), title: Text("Seeding")),
          ListTile(leading: Icon(Icons.yard), title: Text("Transplant")),
        ],
      ),
    );
  }
}
