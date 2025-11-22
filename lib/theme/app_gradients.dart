import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  // Main Background - MUCH DARKER navy from mockup
  static const LinearGradient mainBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0F1936), // Dark navy at top
      Color(0xFF070B1F), // Almost black navy at bottom
    ],
  );

  // Button Orange - Vibrant orange gradient
  static const LinearGradient buttonOrange = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFF9D5C), // Lighter orange
      Color(0xFFFF8C42), // Main orange
    ],
  );
  static const LinearGradient dailygiver = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xFFFF9D5C), Color(0xFF0F1936)],
    stops: [0.2, 0.8], // Adjusted stops for a smoother gradient
  );

  // Glass Card Effect - Very subtle
  static const LinearGradient glassCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x12FFFFFF), // 7% white
      Color(0x08FFFFFF), // 3% white
    ],
  );

  // Logo Card Background - Darker version
}
