// app_header.dart
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final double height;

  const AppHeader({super.key, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        // Gradient background like in mockup - blue/purple tint
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF3A5A8C).withOpacity(0.35), // Blue tint
            const Color(0xFF2A4870).withOpacity(0.25), // Darker blue
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        // Optional: subtle border for depth
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1,
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 60, // Slightly smaller for better proportion
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}