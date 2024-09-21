import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';

class ResourceSelectWidget extends StatelessWidget {
  const ResourceSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: const Icon(Icons.pets),
          title: const Text("Animal"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AnimalForm()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.agriculture),
          title: const Text("Equipment"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EquipmentForm()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text("Land"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LandForm()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.household_supplies),
          title: const Text("Material"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MaterialForm()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.potted_plant),
          title: const Text("Planting"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PlantingForm()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.psychiatry),
          title: const Text("Seed"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SeedForm()));
          },
        ),
      ],
    );
  }
}
