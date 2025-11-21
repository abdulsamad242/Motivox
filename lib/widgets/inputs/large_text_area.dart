import 'package:flutter/material.dart';
import '../../theme/app_text_style.dart';

class LargeTextArea extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final int minLines;

  const LargeTextArea({
    super.key,
    required this.hint,
    this.controller,
    this.minLines = 4,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      cursorColor: const Color(0xFFFF8C42), // Orange cursor
      cursorWidth: 2,
      cursorHeight: 20,
      style: AppTextStyles.body.copyWith(
        color: Colors.white.withOpacity(0.9),
        fontSize: 14.5,
        height: 1.5,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.label.copyWith(
          color: Colors.white.withOpacity(0.35),
          fontSize: 14,
          height: 1.5,
        ),
        filled: true,
        fillColor: const Color(0xFF1A2441).withOpacity(0.8), // background color for the field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.15),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.15),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.18),
            width: 1.2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        isDense: true,
      ),
    );
  }
}
