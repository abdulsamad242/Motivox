import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivix/theme/app_theme.dart';
import 'router/app_router.dart';

void main() {
  runApp(const MotivoxApp());
}

class MotivoxApp extends StatelessWidget {
  const MotivoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),      // Figma's base
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          routerConfig: appRouter,           // <-- Use GoRouter
        );
      },
    );
  }
}
