// step_progress.dart
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class StepProgress extends StatelessWidget {
  final int currentStep;

  const StepProgress({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        bool active = index + 1 == currentStep;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 4,
          width: (MediaQuery.of(context).size.width - 100) / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: active
                ? AppColors.primary
                : Colors.white.withOpacity(0.28),
          ),
        );
      }),
    );
  }
}
