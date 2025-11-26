import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivix/routes/app_routes.dart';

import 'package:motivix/ui/home/main_page.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const MotivoxApp());
}

class MotivoxApp extends StatelessWidget {
  const MotivoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          routerDelegate: AppRoutes.router.routerDelegate,
          routeInformationParser: AppRoutes.router.routeInformationParser,
          routeInformationProvider: AppRoutes.router.routeInformationProvider,
        );
      },
    );
  }
}
