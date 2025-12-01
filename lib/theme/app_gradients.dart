// app_gradients.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  // For splash screen - using solid color with glow overlays instead of gradient
  static const BoxDecoration mainBackground = BoxDecoration(
    color: AppColors.splashBackground,
  );


  // Keep your other gradients for different parts of the app
  static const LinearGradient buttonOrange = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFF9D5C),
      Color(0xFFFF8C42),
    ],
  );

  static const LinearGradient glassCard = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x12FFFFFF),
      Color(0x08FFFFFF),
    ],
  );

  static const LinearGradient logoCard = LinearGradient(
    colors: [
      Color(0xFF1A2745),
      Color(0xFF131F3A),
    ],
  );
}