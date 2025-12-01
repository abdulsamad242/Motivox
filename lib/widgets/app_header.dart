import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeader extends StatelessWidget {
  final double topPadding;
  const AppHeader({super.key, this.topPadding = 0});

  @override
Widget build(BuildContext context) {
  final double statusBar = MediaQuery.of(context).padding.top;
  const double topMargin = 0;          // visual top offset you wanted

  return Padding(
    padding: EdgeInsets.only(top: topMargin.h),
    
    child: ClipRRect(                   // ← clip the whole block
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(22.r),     // NEW
        bottom: Radius.circular(22.r),  // existing
      ),
      child: Container(
        height: statusBar + 120.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 37, 49, 71),
              Color.fromARGB(255, 45, 91, 176),
              Color.fromARGB(255, 37, 49, 71),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  height: 95.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.11),
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 65.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}
