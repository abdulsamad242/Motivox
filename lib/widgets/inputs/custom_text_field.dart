// lib/widgets/inputs/custom_text_field.dart

import 'package:flutter/material.dart';
import '../../theme/app_text_style.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator; // 👈 Add validator
  final List<TextInputFormatter>? inputFormatters; // Optional but useful

  const PrimaryTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.controller,
    this.validator, // 👈 Accept validator
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      onSaved: (value) {
        // Optional: handle saving if needed
      },
      builder: (FormFieldState<String> field) {
        return Container(
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: field.errorText == null
                  ? Colors.white.withOpacity(0.20)
                  : Colors.red, // Show red border on error
              width: field.errorText == null ? 1 : 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: field.errorText == null
                      ? Colors.white.withOpacity(0.85)
                      : Colors.red,
                  size: 18,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    onChanged: (value) {
                      field.didChange(value); // Critical: notify form of change
                    },
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
                      errorText: field.errorText, // Show error below (optional)
                      errorStyle: const TextStyle(height: 0), // Hide default error spacing
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}