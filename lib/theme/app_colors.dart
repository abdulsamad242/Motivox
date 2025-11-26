import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors - Matched to mockup
  static const Color primary = Color(0xFFFF8C42); // Orange
  static const Color secondary = Color(0xFF2B7FFF); // Bright Blue
  static const Color mainBackground = Color(0xFF0B1732);

  static const Color buttonBackground = Color(0xFF2196F3);

  // Backgrounds - MUCH DARKER Navy Blues from mockup
  static const Color bgDark = Color(0xFF070B1F); // Very very dark navy
  static const Color bgGradientTop = Color(0xFF0F1936); // Dark navy blue
  static const Color bgGradientBottom = Color(
    0xFF070B1F,
  ); // Deep navy (almost black)

  // Cards & Surfaces - Darker versions
  static const Color cardDark = Color(0xFF1A2441); // Darker card background
  static const Color cardDarkBlue = Color(0xFF16213D); // Even darker logo card
  static const Color glassLight = Color(0x0FFFFFFF); // Very subtle glass effect

  // Text Colors - Adjusted for darker background
  static const Color textWhite = Color(0xFFFFFFFF); // Pure white
  static const Color textLight = Color(0xFFE5E9F5); // Very light for body text
  static const Color textGrey = Color(0xFF7B8599); // More muted grey for labels
  static const Color textSubtle = Color(0xFF5A6277); // Even more subtle

  // Border Colors - More subtle for dark background
  static const Color borderLight = Color(0xFF2A3548); // Very subtle borders
  static const Color borderSubtle = Color(
    0x12FFFFFF,
  ); // Almost invisible borders

  // Icons
  static const Color iconLight = Color(0xFFA0A8BB);

  // Progress Indicator
  static const Color progressActive = Color(0xFFFF8C42); // Orange
  static const Color progressInactive = Color(0xFF2A3548); // Dark grey
}
