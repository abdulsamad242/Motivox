// app_header.dart
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final double height;

  const AppHeader({super.key, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF374E8C), Color(0xFF223365)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png", // Your logo asset
                    height: 60,
                  ),
                ),
              );
  }
}
