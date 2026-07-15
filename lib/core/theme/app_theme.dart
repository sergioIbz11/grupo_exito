import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryYellow = Color(0xFFFEE23B);

  ThemeData get getThemeData => ThemeData(
    colorSchemeSeed: primaryYellow,

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryYellow,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
