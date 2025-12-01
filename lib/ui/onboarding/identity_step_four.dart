// identity_step_four.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';
import '../onboarding/why_summary_page.dart';

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

  String? _validatePositioning() {
    if (!_submitted) return null;
    final text = _positioningController.text.trim();
    if (text.isEmpty) return "Positioning is required";
    if (text.length < 10) return "Positioning must be at least 10 characters";
    return null;
  }

  String? _validateBranding() {
    if (!_submitted) return null;
    final text = _brandingController.text.trim();
    if (text.isEmpty) return "Branding is required";
    if (text.length < 10) return "Branding must be at least 10 characters";
    return null;
  }

  void _onSubmit() {
    setState(() => _submitted = true);

    if (_validatePositioning() != null || _validateBranding() != null) {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WhySummaryPage()),
    );
  }

  // -------------------------------
  // REUSABLE TEXT AREA SECTION
  // -------------------------------
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
        /// TITLE ROW (Perfect Alignment)
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

        /// OUTER CONTAINER
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
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
              /// EXAMPLE
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

              /// INPUT BOX
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

              /// ERROR TEXT
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

  // --------------------------
  // BUILD SCREEN
  // --------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
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

                /// MAIN TITLE
                Center(
                  child: Text(
                    "Build Your Unique Identity",
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
                    "Define how the world sees you — your values, voice, and vision.",
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

                /// POSITIONING
                _buildTextArea(
                  title: "Positioning (How you want to be seen)",
                  iconPath: "assets/icons/pos.png",
                  example:
                      "Ex: A friendly, inspiring fitness coach who helps working women stay healthy.",
                  hint: "The trusted fitness coach for busy professionals...",
                  controller: _positioningController,
                  validator: _validatePositioning,
                ),

                SizedBox(height: 35.h),

                /// BRANDING
                _buildTextArea(
                  title: "Branding (Your identity & style)",
                  iconPath: "assets/icons/brand.png",
                  example:
                      "Ex: Calm, positive, empowering tone in everything I create.",
                  hint: "Describe your personal style and tone...",
                  controller: _brandingController,
                  validator: _validateBranding,
                ),

                SizedBox(height: 35.h),

                /// BUTTON
                PrimaryButton(
                  label: "Submit",
                  onTap: () {
  context.go('/why');
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
