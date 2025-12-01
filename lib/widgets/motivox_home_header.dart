import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_typography.dart';

class MotivoxHomeHeader extends StatelessWidget {
  final double progress;
  final String username;
  final String quote;

  const MotivoxHomeHeader({
    super.key,
    this.progress = 0.0,
    this.username = "Alex",
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).padding.top;
    const topMargin = 0.0;

    return Padding(
      padding: EdgeInsets.only(top: topMargin.h),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22.r),
          bottom: Radius.circular(22.r),
        ),
        child: Container(
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
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _gllassRow(
                    Row(
                      children: [
                        Image.asset("assets/images/logo.png", height: 65.h),
                        const Spacer(),
                        _progressCircle(),
                        SizedBox(width: 12.w),
                        _circleIcon("assets/icons/bell.png"),
                        SizedBox(width: 12.w),
                        _circleIcon("assets/icons/settingss.png"),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _glassRow(
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.asset(
                            "assets/images/profile_pic.png",
                            height: 45.h,
                            width: 45.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, $username",
                              style: AppTypography.sectionTitle.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "Let’s  achieve goals together!",
                              style: AppTypography.bodySmall.copyWith(
                                color: Colors.white70,
                                fontSize: 13.3.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "❝",
                          style: TextStyle(
                            color: Color(0xFFFF9001),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            quote,
                            style: AppTypography.sectionTitle.copyWith(
                              fontSize: 14.5.sp,
                              color: Colors.black87,
                              height: 1.35,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        const Text(
                          "❞",
                          style: TextStyle(
                            color: Color(0xFFFF9001),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassRow(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _gllassRow(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _progressCircle() {
    return SizedBox(
      width: 44.w,
      height: 44.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 5.w,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation(Color(0xFFFF9001)),
          ),
          Text(
            "${(progress * 100).toInt()}%",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(String asset) {
    return Container(
      width: 46.w,
      height: 46.h,
      padding: EdgeInsets.all(11.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
      child: Image.asset(asset, color: Colors.white),
    );
  }
}
