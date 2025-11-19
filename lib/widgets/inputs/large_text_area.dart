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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2441).withOpacity(0.6), // Darker card background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: TextFormField(
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
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          isCollapsed: true,
        ),
      ),
    );
  }
}