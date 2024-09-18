import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/pages/pages.dart';
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
    super.initState();
    _getAnimals();
  }

  Future<void> _getAnimals() async {
    _animals = await getItemsByUser<Animal>();
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
              title: Text(_animals[index].nickname),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AnimalNewPage())),
          child: const Icon(Icons.add)),
    );
  }
}
