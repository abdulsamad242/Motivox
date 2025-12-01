import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';
import '../onboarding/identity_step_four.dart';

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

  String? _validateMission() {
    if (!_submitted) return null;
    final text = _missionController.text.trim();
    if (text.isEmpty) return "Mission is required";
    if (text.length < 10) return "Mission must be at least 10 characters";
    return null;
  }

  String? _validateVision() {
    if (!_submitted) return null;
    final text = _visionController.text.trim();
    if (text.isEmpty) return "Vision is required";
    if (text.length < 10) return "Vision must be at least 10 characters";
    return null;
  }

  void _onContinue() {
    setState(() => _submitted = true);
    if (_validateMission() != null || _validateVision() != null) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const IdentityStepFour()),
    );
  }

  Widget _buildTextArea({
  required String title,
  required String example,
  required String hint,
  required String iconPath,
  required TextEditingController controller,
  required String? Function() validator,
}) {
  final error = validator();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// ICON + TITLE (perfect alignment)
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

      /// TEXTAREA OUTER CONTAINER
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: error != null ? Colors.red : Colors.white.withOpacity(0.35),
            width: 2,
          ),
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
                color: Colors.white.withOpacity(0.6),
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
              padding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),

              child: TextField(
                controller: controller,
                minLines: 3,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                cursorColor: const Color(0xFFFF8C42),
                style: AppTypography.subtitle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.45,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: AppTypography.hint,
                  filled: false,                     // no bg
                  fillColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),

            if (error != null)
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
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
    return Scaffold(
      body: AppBackground(
        
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                const AppHeader(),
                SizedBox(height: 20.h),

                /// STEP INDICATOR
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

                /// MAIN TITLE
                Center(
                  child: Text(
                    "Define Your Purpose",
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
                    "Tell us what drives you, so Motivo can guide you every day.",
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

                /// MISSION SECTION
                _buildTextArea(
                  title: "Your Mission (Your Goal / Why You Do It)",
                  iconPath: "assets/icons/mis.png",
                  example:
                      "Example: “I want to help 1 million working women stay fit and healthy to live happier lives.”",
                  hint: "Helping people live healthier lives...",
                  controller: _missionController,
                  validator: _validateMission,
                ),

                SizedBox(height: 35.h),

                /// VISION SECTION
                _buildTextArea(
                  title: "Your Vision (The Bigger Picture)",
                  iconPath: "assets/icons/vis.png",
                  example:
                      "Ex: To empower working women to build a culture of fitness, confidence & joy.",
                  hint: "Share the impact you dream of creating...",
                  controller: _visionController,
                  validator: _validateVision,
                ),

                SizedBox(height: 35.h),

                /// CONTINUE BUTTON
                PrimaryButton(
                  label: "Continue",
                  onTap: () {
  context.go('/stepfour');
}
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      
    );
  }
}
