import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:farm_home/auth_gate.dart';
import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/providers.dart';

import 'constants/constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.app().setAutomaticDataCollectionEnabled(true);
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
                  HomeProvider(firebaseFirestore: _firebaseFirestore)),
          Provider<SettingProvider>(
            create: (_) => SettingProvider(
                prefs: prefs, firebaseFirestore: _firebaseFirestore),
          ),
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(
                firebaseAuth: FirebaseAuth.instance,
                googleSignIn: GoogleSignIn(
                    clientId:
                        "151592527578-mp8p672pkcmog3sl1bdfi46scipalhlj.apps.googleusercontent.com"),
                prefs: prefs,
                firebaseFirestore: _firebaseFirestore),
          ),
          ChangeNotifierProvider<ResourceProvider>(
              create: (_) => ResourceProvider()),
          ChangeNotifierProvider<ReferenceProvider>(
              create: (_) => ReferenceProvider()),
        ],
        child: MaterialApp(
          title: AppConstants.appTitle,
          theme: farmHomeTheme,
          home: const AuthGate(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
