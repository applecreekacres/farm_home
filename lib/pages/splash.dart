import 'package:flutter/material.dart';
import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/pages/pages.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if(context.mounted)
    {
      _checkSignedIn();
    }
  }

  Future<void> _checkSignedIn() async {
    final authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const HomePage(
                  title: AppConstants.appTitle,
                )),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   "images/app_icon.png",
            //   width: 100,
            //   height: 100,
            // ),
            SizedBox(height: 20),
            Container(
              width: 20,
              height: 20,
              child:
                  CircularProgressIndicator(color: ColorConstants.themeColor),
            ),
          ],
        ),
      ),
    );
  }
}
