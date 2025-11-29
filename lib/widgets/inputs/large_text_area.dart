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
      // SINGLE GLASSCARD CONTAINER
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),      // glass effect
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.58),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),

      child: TextFormField(
        controller: controller,
        minLines: minLines,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,

        cursorColor: const Color(0xFFFF8C42),
        cursorWidth: 2,
        cursorHeight: 20,

        style: AppTextStyles.body.copyWith(
          color: Colors.white.withOpacity(0.95),
          fontSize: 14.5,
          height: 1.45,
        ),

        decoration: InputDecoration(
          /// **100% PURE HINT – ZERO BACKGROUND**
          hintText: hint,
          hintStyle: AppTextStyles.label.copyWith(
            color: Colors.white.withOpacity(0.65),
            fontSize: 14,
            height: 1.45,
          ),

          // remove ALL default Material backgrounds
          filled: false,
          fillColor: Colors.transparent,

          // NO borders from InputDecoration
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,

          // ensure no injected padding
          isCollapsed: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
