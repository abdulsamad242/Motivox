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
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0F1936), // deep navy base
      Color(0xFF1B274B), // smooth mid tone (important)
      Color(0xFFFF9D5C), // orange corner
    ],
    stops: [
      0.0, // full navy start
      0.55, // soft mid-blend (not too harsh)
      1.0, // orange only at the far edge
    ],
  );

  static const LinearGradient dailygiver2 = LinearGradient(
    begin: Alignment.topRight, // 🔥 Start from top-right (orange)
    end: Alignment.bottomLeft, // 🔵 End at bottom-left (navy)
    colors: [
      Color(0xFFFF9D5C), // ORANGE (top-right)
      Color(0xFF1B274B), // SOFT BLEND
      Color(0xFF0F1936), // NAVY (bottom)
    ],
    stops: [
      0.0, // Orange start
      0.45, // Smooth transition
      1.0, // Navy bottom
    ],
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
