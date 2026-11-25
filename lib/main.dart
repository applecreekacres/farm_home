import 'package:farm_home/firebase_access.dart';
import 'package:farm_home/models/models.dart';
import 'package:material_ui/material_ui.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:farm_home/auth_gate.dart';
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

  late final FirebaseAccess firebase;
  late final ItemAccess access;

  FarmHome({super.key, required this.prefs}) {
    firebase = FirebaseAccess(_firebaseFirestore);
    access = ItemAccess(firebase, prefs);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ResourceProvider>(
              create: (_) => ResourceProvider(access)),
          ChangeNotifierProvider<ReferenceProvider>(
              create: (_) => ReferenceProvider(access)),
          ChangeNotifierProvider<RecordProvider>(
              create: (_) => RecordProvider(access)),
          Provider<ItemAccess>(create: (_) => access),
        ],
        child: MaterialApp(
          title: AppConstants.appTitle,
          theme: farmHomeTheme,
          home: const AuthGate(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
