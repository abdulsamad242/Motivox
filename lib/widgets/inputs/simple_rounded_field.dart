import 'package:flutter/material.dart';
import '../../theme/app_text_style.dart';

class SimpleRoundedField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;

  const SimpleRoundedField({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D3A57).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.25),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              cursorColor: const Color(0xFFFF8C42),
              cursorWidth: 2,
              cursorHeight: 20,
              style: AppTextStyles.body.copyWith(
                color: Colors.white.withOpacity(0.95),
                fontSize: 14.5,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.label.copyWith(
                  color: Colors.white.withOpacity(0.40),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                isCollapsed: true,
                counterText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}