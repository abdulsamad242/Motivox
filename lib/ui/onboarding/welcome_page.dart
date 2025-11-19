import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_text_style.dart';
import '../../theme/app_gradients.dart';
import '../../widgets/buttons/social_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.mainBackground,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  /// LOGO CARD
                  Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
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

                  SizedBox(height: 20.h),

                  /// QUOTE
                  Text(
                    "Every big journey begins with a single step — you're taking yours now!",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14.sp,
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// ONBOARDING ILLUSTRATION
                  Image.asset(
                    "assets/images/welcome_illustration.png",
                    height: 260.h,
                    fit: BoxFit.contain,
                  ),

                  SizedBox(height: 25.h),

                  /// TITLE
                  Text(
                    "Let’s Get You Started",
                    style: AppTextStyles.heading2.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    "Sign up using one of your preferred accounts",
                    style: AppTextStyles.label.copyWith(fontSize: 13.sp),
                  ),

                  SizedBox(height: 25.h),

                  /// SOCIAL BUTTONS
                  SocialButton(
                    icon: "assets/icons/google.png",
                    label: "Continue with Google",
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),

                  SocialButton(
                    icon: "assets/icons/facebook.png",
                    label: "Continue with Facebook",
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),

                  SocialButton(
                    icon: "assets/icons/linkedin.png",
                    label: "Continue with LinkedIn",
                    onTap: () {},
                  ),

                  SizedBox(height: 35.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
