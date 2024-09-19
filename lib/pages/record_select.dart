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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HarvestRecordForm()));
            },
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
            leading: const Icon(Icons.construction),
            title: const Text("Maintenance"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MaintenanceRecordForm()));
            },
          ),
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
          ListTile(
            leading: const Icon(Icons.yard),
            title: const Text("Potting Up"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PottingUpRecordForm()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text("Purchase"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PurchaseRecordForm()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.currency_exchange_rounded),
            title: const Text("Sale"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SaleRecordForm()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.yard),
            title: const Text("Seeding"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SeedingRecordForm()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.yard),
            title: const Text("Transplant"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransplantRecordForm()));
            },
          ),
        ],
      ),
    );
  }
}
