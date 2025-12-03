import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final TextStyle? textStyle;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(23.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // ← CENTER CONTENT
          children: [
            Image.asset(icon, height: 20.h, width: 20.h, fit: BoxFit.contain),
            SizedBox(width: 12.w), // perfect spacing
            Text(label, style: textStyle),
          ],
        ),
      ),
    );
  }
}
