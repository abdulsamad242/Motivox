// app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (logo colors)
  static const Color primary = Color.fromRGBO(255, 134, 31, 1); // Orange
  static const Color secondary = Color(0xFF2B7FFF); // Blue

  // Splash Background (EXACT MOCKUP COLORS)
  static const Color splashBackground = Color(0xFF01011A); // Solid color from mockup

  // White glow effects for splash screen
  static const Color whiteGlowTop = Color(0x0AFFFFFF); // Top glow - 4% opacity
  static const Color whiteGlowCenter = Color(0x08FFFFFF); // Center glow - 3% opacity
  static const Color whiteGlowBottom = Color(0x05FFFFFF); // Bottom glow - 2% opacity

  // Text colors
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFFE5E9F5);
  static const Color textGrey = Color(0xFF7B8599);
  static const Color textSubtle = Color(0xFF4A5268);

  // Other colors (keep your existing ones)
  static const Color cardDark = Color(0xFF0C122B);
  static const Color cardDarkBlue = Color(0xFF0A1024);
  static const Color borderLight = Color(0xFF1C2336);
  static const Color borderSubtle = Color(0x12FFFFFF);
  static const Color iconLight = Color(0xFFA0A8BB);
  static const Color progressActive = Color(0xFFFF8C42);
  static const Color progressInactive = Color(0xFF1C2336);
}