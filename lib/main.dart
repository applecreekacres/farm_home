import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/pages.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(FarmHome(prefs: prefs));
}

class FarmHome extends StatelessWidget {
  final SharedPreferences prefs;

  final _firebaseFirestore = FirebaseFirestore.instance;

  FarmHome({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<HomeProvider>(
              create: (_) =>
                  HomeProvider(firebaseFirestore: this._firebaseFirestore)),
        ],
        child: MaterialApp(
          title: 'Farm Home',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400),
            useMaterial3: true,
          ),
          home: const HomePage(title: 'Farm Home Page'),
          debugShowCheckedModeBanner: false,
        ));
  }
}
