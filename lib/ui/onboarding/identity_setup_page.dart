import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:motivix/cubits/splash/splash_cubit.dart';
import 'package:motivix/common/models/onboarding_step_one.dart';

import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/inputs/custom_text_field.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class IdentityStepOne extends StatefulWidget {
  const IdentityStepOne({super.key});

  @override
  State<IdentityStepOne> createState() => _IdentityStepOneState();
}

class _IdentityStepOneState extends State<IdentityStepOne> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  String? _validatePhone(String? v) {
    if (v == null || v.trim().isEmpty) return "Phone number is required";
    if (RegExp(r'[a-zA-Z]').hasMatch(v)) return "Alphabets not allowed";

    final digits = v.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 7) return "Too short";
    if (digits.length > 15) return "Too long";

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final splash = context.watch<SplashCubit>();
    final data = splash.getCachedScreen("onboarding-step1") as OnboardingScreenOne;

    final meta = data.meta;
    final fields = meta.form.fields;

    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                      "1/4",
                      style: AppTypography.formLabel.copyWith(
                        fontSize: 14.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const StepProgress(currentStep: 1),
                  ],
                ),

                SizedBox(height: 28.h),

                Center(
                  child: Column(
                    children: [
                      Text(
                        meta.welcomeMessage.replaceAll("{{name}}", "Imtiyaz"),
                        textAlign: TextAlign.center,
                        style: AppTypography.title.copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        meta.tagline,
                        textAlign: TextAlign.center,
                        style: AppTypography.subtitle.copyWith(
                          fontSize: 18.sp,
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Icon(Icons.person, color: Colors.white, size: 26.sp),
                    ),
                    SizedBox(width: 10.w),
                    Text(meta.title, style: AppTypography.sectionTitle),
                  ],
                ),

                SizedBox(height: 18.h),

                Text(fields[0].label, style: AppTypography.formLabel),
                SizedBox(height: 6.h),
                PrimaryTextField(
                  hint: fields[0].placeholder ?? "",
                  icon: Icons.person,
                  controller: _name,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Name required";
                    if (v.trim().length < 2) return "Too short";
                    if (!RegExp(r"^[a-zA-Z\s\-'.]+$").hasMatch(v.trim())) {
                      return "Invalid characters";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 18.h),

                Text(fields[1].label, style: AppTypography.formLabel),
                SizedBox(height: 6.h),
                PrimaryTextField(
                  hint: fields[1].placeholder ?? "",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return "Email required";
                    if (!_emailRegex.hasMatch(v.trim())) return "Invalid email";
                    return null;
                  },
                ),

                SizedBox(height: 18.h),

                Text(fields[2].label, style: AppTypography.formLabel),
                SizedBox(height: 6.h),
                PrimaryTextField(
                  hint: fields[2].placeholder ?? "",
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  controller: _phone,
                  validator: _validatePhone,
                ),

                SizedBox(height: 30.h),

                PrimaryButton(
                  label: fields[3].label,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.go('/steptwo');
                    }
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
