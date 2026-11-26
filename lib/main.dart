import 'package:farm_home/auth_gate.dart';
import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/firebase_options.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.app().setAutomaticDataCollectionEnabled(true);
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const FarmHome(),
    ),
  );
}

class FarmHome extends StatelessWidget {
  const FarmHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: farmHomeTheme,
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
