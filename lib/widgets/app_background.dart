import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/3.0x/b.png",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            isAntiAlias: false,
          ),
        ),
        child, // your page UI goes here
      ],
    );
  }
}
