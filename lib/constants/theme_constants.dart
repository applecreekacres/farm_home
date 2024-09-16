import 'package:flutter/material.dart';

class ColorConstants {
  static const themeColor = Color.fromARGB(255, 75, 152, 108);
  static const primaryColor = Color.fromARGB(255, 75, 152, 108);
}

ThemeData farmHomeTheme = ThemeData(
  primaryColor: ColorConstants.primaryColor,
  fontFamily: 'Urbanist',
  useMaterial3: true,
);
