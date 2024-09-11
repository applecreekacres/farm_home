import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(AppConstants.appTitle),
      ),
      body: const Center(),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text("User"),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Records"),
          ),
          ListTile(
            leading: Icon(Icons.pets),
            title: Text("Animals")
          ),
          ListTile(
            leading: Icon(Icons.yard),
            title: Text("Plantings")
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Land")
          )
        ],
      )),
      // floatingActionButton: FloatingActionButton(),
    );
  }
}
