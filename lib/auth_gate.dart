import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// firebase_ui_auth still builds TextFields from package:flutter/material.dart.
// Those widgets look up Flutter's Theme and MaterialLocalizations, which
// material_ui's MaterialApp does not provide.
// ignore: deprecated_member_use
import 'package:flutter/material.dart' as framework;
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  Future<void> _saveUserData(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (!snapshot.hasData) {
            return framework.MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: framework.ThemeData(
                colorScheme: framework.ColorScheme.fromSeed(
                  seedColor: ColorConstants.themeColor,
                  primary: ColorConstants.primaryColor,
                  secondary: ColorConstants.secondaryColor,
                  tertiary: ColorConstants.tertiaryColor,
                  surface: ColorConstants.primaryBackground,
                ),
                useMaterial3: true,
              ),
              home: SignInScreen(
                providers: [EmailAuthProvider()],
                subtitleBuilder: (context, action) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: action == AuthAction.signIn
                        ? const Text('Welcome to Farm Home, please sign in!')
                        : const Text('Welcome to Farm Home, please sign up!'),
                  );
                },
                footerBuilder: (context, action) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      'By signing in, you agree to our terms and conditions.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            );
          } else {
            _saveUserData(snapshot.data!);
            return const HomePage();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
