import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivix/ui/onboarding/welcome_page.dart';

import 'theme/app_theme.dart';
import 'ui/onboarding/splash_page.dart';
import 'ui/onboarding/identity_setup_page.dart';
import 'ui/onboarding/step_two_growth_area.dart';
import 'ui/onboarding/purpose_step_three.dart';
import 'ui/onboarding/identity_step_four.dart';
import 'ui/onboarding/why_summary_page.dart';

void main() {
  runApp(const MotivoxApp());
}

class MotivoxApp extends StatelessWidget {
  const MotivoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),  // Figma size (iPhone 14 Pro)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: const WhySummaryPage(),   // <-- START FROM SPLASH
        );
      },
    );
  }
}
