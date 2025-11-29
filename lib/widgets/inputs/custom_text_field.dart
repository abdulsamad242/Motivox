import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_typography.dart';

class PrimaryTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? hintStyle;

  const PrimaryTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: field.errorText == null
                      ? Colors.white.withOpacity(0.20)
                      : Colors.red,
                  width: field.errorText == null ? 1 : 2,
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    /// ICON
                    Icon(
                      icon,
                      color: field.errorText == null
                          ? Colors.white.withOpacity(0.85)
                          : Colors.red,
                      size: 18,
                    ),

                    const SizedBox(width: 12),

                    /// TEXT INPUT FIELD
                    Expanded(
                      child: TextField(
                        controller: controller,
                        keyboardType: keyboardType,
                        inputFormatters: inputFormatters,
                        onChanged: field.didChange,

                        style: AppTypography.hint.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.2,
                        ),

                        decoration: InputDecoration(
                          hintText: hint,
                          filled: false,
                          fillColor: Colors.transparent,
                          /// CUSTOM HINT STYLE
                          hintStyle: AppTypography.hint.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.55),
                          ),

                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ERROR MESSAGE (We show it cleanly BELOW the field)
            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 6),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
