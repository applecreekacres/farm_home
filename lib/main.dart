import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FarmHome());
}

class FarmHome extends StatelessWidget {
  const FarmHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Farm Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
            title: Text("Records"),
          )
        ],
      )),
      // floatingActionButton: FloatingActionButton(),
    );
  }
}
