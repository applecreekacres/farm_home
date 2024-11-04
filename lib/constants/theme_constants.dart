import 'package:flutter/material.dart';

class ColorConstants {
  static const themeColor = Color.fromARGB(255, 0x48, 0x98, 0x6C);
  static const primaryColor = Color.fromARGB(255, 75, 152, 108);
  static const secondaryColor = Color.fromARGB(255, 0x96, 0x81, 0x63);
  static const tertiaryColor = Color.fromARGB(255, 0x6D, 0x60, 0x4A);
  static const alternate = Color.fromARGB(255, 0xC8, 0xD7, 0xE4);

  static const primaryText = Color.fromARGB(255, 0x0B, 0x19, 0x1E);
  static const secondaryText = Color.fromARGB(255, 0x38, 0x4E, 0x58);
  static const primaryBackground = Color.fromARGB(255, 0xF1, 0xF4, 0xF8);
  static const secondaryBackground = Colors.white;
}

ThemeData farmHomeTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorConstants.themeColor,
    primary: ColorConstants.primaryColor,
    secondary: ColorConstants.secondaryColor,
    tertiary: ColorConstants.tertiaryColor,
    surface: ColorConstants.primaryBackground,
  ),
  fontFamily: 'Urbanist',
  useMaterial3: true,
);
