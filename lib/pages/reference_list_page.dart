import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/pages/animal_form.dart';
import 'package:farm_home/pages/home.dart';
import 'package:farm_home/providers/reference_provider.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ReferenceListPage extends StatefulWidget {
  const ReferenceListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReferenceListPageState();
}

class _ReferenceListPageState extends State<ReferenceListPage> {
  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<ReferenceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("References"),
      ),
      drawer: const FarmHomeDrawer(),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: ItemList(
            items: refProvider.references,
            title: (data) => Text(data.name),
            trailing: (data) => Text(data.itemName()),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
