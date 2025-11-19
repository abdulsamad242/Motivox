import 'package:flutter/material.dart';
import '../../theme/app_text_style.dart';

class PrimaryTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const PrimaryTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.20),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white.withOpacity(0.85),
              size: 18,
            ),
            const SizedBox(width: 12),

            // TEXTFIELD
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                style: AppTextStyles.body.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: AppTextStyles.label.copyWith(
                    color: Colors.white.withOpacity(0.55),
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  isCollapsed: true, // perfect vertical alignment
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
