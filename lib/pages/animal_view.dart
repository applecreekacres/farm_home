import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/pages/pages.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';

class AnimalView extends StatelessWidget {
  const AnimalView({super.key});

  @override
  Widget build(BuildContext context) {
    final animal =
        Provider.of<ResourceProvider<Animal>>(context, listen: false).resource!;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("Animals"),
        ),
        drawer: const FarmHomeDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AnimalForm()));
          },
          child: const Icon(Icons.edit),
        ),
        body: Column(
          children: [Text(animal.name)],
        ));
  }
}
