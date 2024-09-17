import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:farm_home/widgets/widgets.dart';

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
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(AppConstants.appTitle),
      ),
      body: const Center(),
      drawer: const FarmHomeDrawer(),
      // floatingActionButton: FloatingActionButton(),
    );
  }
}
