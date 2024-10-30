import 'package:flutter/material.dart';

import 'package:farm_home/pages/pages.dart';
import 'package:farm_home/widgets/widgets.dart';

class AnimalView extends StatelessWidget {
  final int index;

  const AnimalView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

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
        body: const Text("Lorem"));
  }
}
