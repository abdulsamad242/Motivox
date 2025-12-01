import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';
import '../onboarding/purpose_step_three.dart';

class GrowthAreaStepTwo extends StatefulWidget {
  const GrowthAreaStepTwo({super.key});

  @override
  State<GrowthAreaStepTwo> createState() => _GrowthAreaStepTwoState();
}

class _GrowthAreaStepTwoState extends State<GrowthAreaStepTwo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _microNicheController = TextEditingController();

  String? _selectedNiche;
  final List<String> _nicheOptions = [
    "Business",
    "Fitness & Health",
    "Marketing",
    "Content Creation",
    "Finance",
    "Tech & Automation",
    "Other",
  ];

  @override
  void dispose() {
    _microNicheController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_formKey.currentState?.validate() ?? false) {
        context.go('/stepthree');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER
                const AppHeader(),
                SizedBox(height: 20.h),

                /// STEP INDICATOR + PROGRESS
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

                /// MAIN TITLE
                Center(
                  child: Text(
                    "Choose your growth area",
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
                    "Pick a field you want to focus on. This helps us suggest relevant content.",
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

                // ----------------------------------------------------
                //                     NICHE SECTION
                // ----------------------------------------------------
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
                            "Niche (Expertise / Focus Area)",
                            style: AppTypography.sectionTitle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Your niche is where your skills, passion, and purpose come together",
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

                /// NICHE DROPDOWN
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
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                  hint: Text("Ex: Fitness & Health", style: AppTypography.hint),
                  items: _nicheOptions.map((niche) {
                    return DropdownMenuItem(
                      value: niche,
                      child: Text(
                        niche,
                        style: AppTypography.subtitle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                  value: _selectedNiche,
                  onChanged: (value) => setState(() {
                    _selectedNiche = value;
                  }),
                  validator: (value) =>
                      value == null ? 'Please select a niche' : null,
                ),

                SizedBox(height: 32.h),

                // ----------------------------------------------------
                //                 MICRO NICHE SECTION
                // ----------------------------------------------------
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
                            "Micro Niche (Narrow Down Your Focus)",
                            style: AppTypography.sectionTitle.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Helping Working Moms Stay Fit with Yoga",
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

                /// MICRO NICHE INPUT
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
                    hintText: "Ex: Helping Working Moms Stay Fit with Yoga",
                    hintStyle: AppTypography.hint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.25),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Micro niche is required';
                    }
                    if (value.trim().length < 3) {
                      return 'Must be at least 3 characters';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 35.h),

                /// NEXT BUTTON
                PrimaryButton(
                  label: "Next",
                  onTap: () {
                    context.go('/stepthree');
                  },
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
