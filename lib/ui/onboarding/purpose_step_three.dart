import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:motivix/cubits/splash/splash_cubit.dart';
import 'package:motivix/common/models/onboarding_step_three.dart';

import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class PurposeStepThree extends StatefulWidget {
  const PurposeStepThree({super.key});

  @override
  State<PurposeStepThree> createState() => _PurposeStepThreeState();
}

class _PurposeStepThreeState extends State<PurposeStepThree> {
  final TextEditingController _missionController = TextEditingController();
  final TextEditingController _visionController = TextEditingController();

  bool _submitted = false;

  @override
  void dispose() {
    _missionController.dispose();
    _visionController.dispose();
    super.dispose();
  }

  /// API-driven validation
  String? _validateDynamic(String value, FieldValidation? rules, String fieldName) {
    if (!_submitted) return null;
    final text = value.trim();

    if ((rules?.requiredField ?? false) && text.isEmpty) {
      return "$fieldName is required";
    }
    if (rules?.minLength != null && text.length < rules!.minLength!) {
      return "$fieldName must be at least ${rules.minLength} characters";
    }
    if (rules?.maxLength != null && text.length > rules!.maxLength!) {
      return "$fieldName cannot exceed ${rules.maxLength} characters";
    }

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
        /// ICON + TITLE
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
                  width: 20.w,
                  height: 20.h,
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

        /// OUTER BOX
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Example text
              Text(
                example,
                style: AppTypography.formLabel.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.6),
                  height: 1.35,
                ),
              ),

              SizedBox(height: 12.h),

              /// TEXT FIELD BOX
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
                  cursorColor: const Color(0xFFFF8C42),
                  keyboardType: TextInputType.multiline,
                  style: AppTypography.subtitle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: AppTypography.hint,
                    border: InputBorder.none,
                    isCollapsed: true,
                    fillColor: Colors.transparent,
                    filled: false
                  ),
                ),
              ),

              /// Validation error
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
    final data = splashCubit.getCachedScreen("onboarding-step3") as OnboardingScreenThree;
    final meta = data.meta;

    /// Extract Mission field
    final missionField =
        meta.form.fields.firstWhere((f) => f.name == "mission");

    /// Extract Vision field
    final visionField =
        meta.form.fields.firstWhere((f) => f.name == "vision");

    final missionError = _validateDynamic(
      _missionController.text,
      missionField.validation,
      "Mission",
    );

    final visionError = _validateDynamic(
      _visionController.text,
      visionField.validation,
      "Vision",
    );

    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(),

              SizedBox(height: 20.h),

              /// Step indicator
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "3/4",
                    style: AppTypography.formLabel.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  const StepProgress(currentStep: 3),
                ],
              ),

              SizedBox(height: 30.h),

              /// MAIN HEADING
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

              /// SUBTITLE
              Center(
                child: Text(
                  meta.tagline,
                  textAlign: TextAlign.center,
                  style: AppTypography.subtitle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                    color: Colors.white.withOpacity(0.70),
                    height: 1.4,
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              /// MISSION BLOCK
              _buildTextArea(
                title: meta.missionTitle,
                example: meta.missionExample,
                hint: missionField.placeholder ?? "",
                iconPath: "assets/icons/mis.png",
                controller: _missionController,
                error: missionError,
              ),

              SizedBox(height: 35.h),

              /// VISION BLOCK
              _buildTextArea(
                title: meta.visionTitle,
                example: meta.visionExample,
                hint: visionField.placeholder ?? "",
                iconPath: "assets/icons/vis.png",
                controller: _visionController,
                error: visionError,
              ),

              SizedBox(height: 35.h),

              /// CONTINUE BUTTON (dynamic label)
              PrimaryButton(
                label: meta.form.fields.last.label,
                onTap: () {
                  setState(() => _submitted = true);

                  final missionValid = _validateDynamic(
                      _missionController.text,
                      missionField.validation,
                      "Mission");

                  final visionValid = _validateDynamic(
                      _visionController.text,
                      visionField.validation,
                      "Vision");

                  if (missionValid != null || visionValid != null) return;

                  context.go('/stepfour');
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
