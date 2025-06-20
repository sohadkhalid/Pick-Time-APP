import 'package:flutter/material.dart';

class AppStyle {
  static const Color primaryColor = Colors.green;
  static const Color backgroundColor = Colors.white;
  static final Color inputBackground = Colors.grey.shade200;

  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle normalText = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 10,
    color: Colors.black54,
  );

  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    fontFamily: 'Arial',
    scaffoldBackgroundColor: backgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: const Size.fromHeight(40),
      ),
    ),
  );
}
