import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class CircularProgressCustom extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String label;

  const CircularProgressCustom({
    super.key,
    required this.progress,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 90,
          width: 90,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 10,
            backgroundColor: AppColors.cardDark,
            color: AppColors.primary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
