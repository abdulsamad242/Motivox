import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/common/models/onboarding_step_two.dart';
import 'package:motivix/cubits/splash/splash_cubit.dart';

import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class GrowthAreaStepTwo extends StatefulWidget {
  const GrowthAreaStepTwo({super.key});

  @override
  State<GrowthAreaStepTwo> createState() => _GrowthAreaStepTwoState();
}

class _GrowthAreaStepTwoState extends State<GrowthAreaStepTwo> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedNiche;
  final TextEditingController _otherNicheController = TextEditingController();
  final TextEditingController _microNicheController = TextEditingController();

  @override
  void dispose() {
    _otherNicheController.dispose();
    _microNicheController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.go('/stepthree');
    }
  }

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.watch<SplashCubit>();
    final onboarding =
        splashCubit.getCachedScreen("onboarding-step2") as OnboardingScreenTwo;

    final meta = onboarding.meta;
    final fields = meta.form.fields;

    final dropdownField = fields[0];
    final otherNicheField = fields[1];
    final microField = fields[2];
    final buttonField = fields[3];

    final List<String> nicheOptions = dropdownField.options ?? [];

    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppHeader(),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "2/4",
                      style: AppTypography.formLabel.copyWith(
                        fontSize: 14.sp,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const StepProgress(currentStep: 2),
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
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      height: 1.4,
                      color: Colors.white.withOpacity(0.65),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/icons/niche.png",
                        width: 22.w,
                        height: 22.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meta.nicheTitle,
                            style: AppTypography.sectionTitle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            meta.nicheTagline,
                            style: AppTypography.formLabel.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.65),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22.h),
                DropdownButtonFormField<String>(
                  dropdownColor: const Color(0xFF0F1A3D),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.06),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.25),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide: const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  hint: Text(dropdownField.placeholder ?? "", style: AppTypography.hint),
                  items: nicheOptions.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: AppTypography.subtitle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                  value: _selectedNiche,
                  onChanged: (value) => setState(() => _selectedNiche = value),
                  validator: (value) =>
                      value == null ? 'Please select a niche' : null,
                ),
                SizedBox(height: 32.h),
                if (_selectedNiche == "Other")
                  TextFormField(
                    controller: _otherNicheController,
                    style: AppTypography.subtitle.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.06),
                      hintText: otherNicheField.placeholder,
                      hintStyle: AppTypography.hint,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    validator: (v) {
                      if (_selectedNiche == "Other" &&
                          (v == null || v.trim().isEmpty)) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                if (_selectedNiche == "Other") SizedBox(height: 32.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/icons/microniche.png",
                        width: 22.w,
                        height: 22.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meta.microNicheTitle,
                            style: AppTypography.sectionTitle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            meta.microNicheTagline,
                            style: AppTypography.formLabel.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.75),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: _microNicheController,
                  style: AppTypography.subtitle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.06),
                    hintText: microField.placeholder,
                    hintStyle: AppTypography.hint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.25)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide: const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Required';
                    }
                    if (v.trim().length < 3) return 'Too short';
                    return null;
                  },
                ),
                SizedBox(height: 35.h),
                PrimaryButton(
                  label: buttonField.label,
                  onTap: _onNextPressed,
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
