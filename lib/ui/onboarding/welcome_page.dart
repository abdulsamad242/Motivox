import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_typography.dart';
import '../../widgets/buttons/social_button.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';   // ← NEW
import '../onboarding/identity_setup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  /// 🔵 NEW REUSABLE HEADER (Figma style)
                  const AppHeader(),

                  SizedBox(height: 20.h),

                  /// 🔵 QUOTE — italic, -2 letter spacing
                  Text(
                    "Every big journey begins with a single step — you're taking yours now!",
                    textAlign: TextAlign.center,
                    style: AppTypography.quote,
                  ),

                  SizedBox(height: 20.h),

                  /// 🔵 ILLUSTRATION
                  Image.asset(
                    "assets/images/welcome_illustration.png",
                    height: 260.h,
                  ),

                  SizedBox(height: 25.h),

                  /// 🔵 MAIN TITLE — LEFT
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Let’s Get You Started",
                      style: AppTypography.title,
                    ),
                  ),

                  SizedBox(height: 4.h), // (Previously 6 → now tighter per your -2 spacing request)

                  /// 🔵 SUBTITLE — LEFT
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign up using one of your preferred accounts",
                      style: AppTypography.subtitle,
                    ),
                  ),

                  SizedBox(height: 25.h),

                  /// 🔵 SOCIAL BUTTONS — centered icon + label
                  SocialButton(
                    icon: "assets/icons/google.png",
                    label: "Continue with Google",
                    textStyle: AppTypography.social,
                    onTap: () {
                      context.go('/stepone');
                    },
                  ),

                  SizedBox(height: 12.h),

                  SocialButton(
                    icon: "assets/icons/facebook.png",
                    label: "Continue with Facebook",
                    textStyle: AppTypography.social,
                    onTap: () {
                      context.go('/stepone');
                    },
                  ),

                  SizedBox(height: 12.h),

                  SocialButton(
                    icon: "assets/icons/linkedin.png",
                    label: "Continue with LinkedIn",
                    textStyle: AppTypography.social,
                    onTap: () {
                      context.go('/stepone');
                    },
                  ),

                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
