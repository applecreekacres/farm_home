import 'package:farm_home/pages/animal_species_form.dart';
import 'package:flutter/material.dart';

import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:farm_home/pages/pages.dart';

class ReferenceSelectWidget extends StatelessWidget {
  const ReferenceSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: const Icon(Icons.pets),
          title: const Text("Animal Species"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimalSpeciesForm()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.park),
          title: const Text("Crop Family"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CropFamilyForm()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.grass),
          title: const Text("Crop"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CropForm()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.household_supplies),
          title: const Text("Material Type"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MaterialTypeForm()));
          },
        ),
        ListTile(
          leading: const Icon(Symbols.snowing),
          title: const Text("Season"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SeasonForm()));
          },
        ),
      ],
    );
  }
}
