import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/pages/pages.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:farm_home/widgets/widgets.dart';

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
  List<Animal> _animals = [];

  @override
  void initState() {
    _getAnimals();
    super.initState();
  }

  Future<void> _getAnimals() async {
    _animals = (await getItemsByUser(Animal.collectionName))
        .map((data) => Animal.fromMap(data))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Animals"),
      ),
      drawer: const FarmHomeDrawer(),
      body: ListView.builder(
          itemCount: _animals.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_animals[index].name),
              onTap: () {
                var provider = Provider.of<ResourceProvider<Animal>>(context, listen: false);
                provider.resource = _animals[index];
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AnimalView()));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AnimalForm()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
