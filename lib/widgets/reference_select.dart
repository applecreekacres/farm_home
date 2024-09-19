import 'package:flutter/material.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ReferenceSelectWidget extends StatelessWidget {
  const ReferenceSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: const Icon(Symbols.park),
          title: const Text("Crop Family"),
        ),
        ListTile(
          leading: const Icon(Symbols.grass),
          title: const Text("Crop"),
        ),
        ListTile(
          leading: const Icon(Symbols.household_supplies),
          title: const Text("Material Type"),
        ),
      ],
    );
  }
}
