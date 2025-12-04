// identity_step_four.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:motivix/cubits/splash/splash_cubit.dart';
import 'package:motivix/common/models/onboarding_step_four.dart';

import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class IdentityStepFour extends StatefulWidget {
  const IdentityStepFour({super.key});

  @override
  State<IdentityStepFour> createState() => _IdentityStepFourState();
}

class _IdentityStepFourState extends State<IdentityStepFour> {
  final TextEditingController _positioningController = TextEditingController();
  final TextEditingController _brandingController = TextEditingController();

  bool _submitted = false;

  @override
  void dispose() {
    _positioningController.dispose();
    _brandingController.dispose();
    super.dispose();
  }

  String? _validateField(TextEditingController controller, int minLength, String label) {
    if (!_submitted) return null;
    final text = controller.text.trim();
    if (text.isEmpty) return "$label is required";
    if (text.length < minLength) return "$label must be at least $minLength characters";
    return null;
  }

  Widget _buildTextArea({
    required String title,
    required String example,
    required String hint,
    required String iconPath,
    required TextEditingController controller,
    required String? error,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  iconPath,
                  width: 18.w,
                  height: 18.h,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                example,
                style: AppTypography.formLabel.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.65),
                  height: 1.35,
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: error != null
                        ? Colors.red
                        : Colors.white.withOpacity(0.35),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                child: TextField(
                  controller: controller,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  cursorColor: const Color(0xFFFF8C42),
                  style: AppTypography.subtitle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.45,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: AppTypography.hint,
                    filled: false,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isCollapsed: true,
                  ),
                ),
              ),
              if (error != null)
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.watch<SplashCubit>();
    final data = splashCubit.getCachedScreen("onboarding-step4") as OnboardingScreenFour;
    final meta = data.meta;

    final posField = meta.form.fields.firstWhere((e) => e.name == "positioning");
    final brandField = meta.form.fields.firstWhere((e) => e.name == "branding");

    final posError = _validateField(
      _positioningController,
      posField.validation?.minLength ?? 10,
      posField.label,
    );

    final brandError = _validateField(
      _brandingController,
      brandField.validation?.minLength ?? 10,
      brandField.label,
    );

    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(),
              SizedBox(height: 20.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "4/4",
                    style: AppTypography.formLabel.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  const StepProgress(currentStep: 4),
                ],
              ),

              SizedBox(height: 30.h),

              Center(
                child: Text(
                  meta.heading,
                  textAlign: TextAlign.center,
                  style: AppTypography.title.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              Center(
                child: Text(
                  meta.tagline,
                  textAlign: TextAlign.center,
                  style: AppTypography.subtitle.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white.withOpacity(0.70),
                    height: 1.4,
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              _buildTextArea(
                title: meta.positioningTitle,
                example: meta.positioningExample,
                hint: posField.placeholder ?? "",
                iconPath: "assets/icons/pos.png",
                controller: _positioningController,
                error: posError,
              ),

              SizedBox(height: 35.h),

              _buildTextArea(
                title: meta.brandingTitle,
                example: meta.brandingExample,
                hint: brandField.placeholder ?? "",
                iconPath: "assets/icons/brand.png",
                controller: _brandingController,
                error: brandError,
              ),

              SizedBox(height: 35.h),

              PrimaryButton(
                label: meta.form.fields.last.label,
                onTap: () {
                  setState(() => _submitted = true);

                  if (posError != null) return;
                  if (brandError != null) return;

                  context.go('/why');
                },
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
