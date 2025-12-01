import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: "Inter",

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1B2647),
      hintStyle: TextStyle(color: Color(0xFF9AA1C2)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color(0xFF3C4B78)),
      ),
    ),
  );
}
