import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:farm_home/pages/pages.dart';

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
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
              ],
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
