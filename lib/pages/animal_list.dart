import 'package:farm_home/pages/animal_form.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
  @override
  Widget build(BuildContext context) {
    var animals = Provider.of<ResourceProvider>(context).animals;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Animals"),
      ),
      drawer: const FarmHomeDrawer(),
      body: FutureWidget(
          future: animals,
          onData: (data) {
            if (data != null) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index].name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnimalForm(
                                      resource: data[index],
                                    )));
                        setState(() {});
                      },
                    );
                  });
            } else {
              return Text("Unable to load animals");
            }
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
