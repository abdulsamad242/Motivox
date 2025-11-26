// growth_step_two.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/routes/app_routes.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../onboarding/purpose_step_three.dart';

class GrowthAreaStepTwo extends StatefulWidget {
  const GrowthAreaStepTwo({super.key});

  @override
  State<GrowthAreaStepTwo> createState() => _GrowthAreaStepTwoState();
}

class _GrowthAreaStepTwoState extends State<GrowthAreaStepTwo> {
  final _formKey = GlobalKey<FormState>();
  final _microNicheController = TextEditingController();

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
      context.push(AppRoutes.identityStepthree);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFFF8C42),
          selectionColor: Color(0x4DFF8C42),
          selectionHandleColor: Color(0xFFFF8C42),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainBackground,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppHeader(),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        const Expanded(child: StepProgress(currentStep: 2)),
                        const SizedBox(width: 14),
                        Text(
                          "2/4",
                          style: AppTextStyles.body.copyWith(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.70),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Text(
                      "Choose your growth area",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heading1.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Pick a field you want to focus on. This helps us suggest relevant content.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                        height: 1.45,
                        color: Colors.white.withOpacity(0.65),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // NICHE SECTION
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.explore,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Niche (Expertise / Focus Area)",
                            style: AppTextStyles.heading2.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Your niche is where your skills, passion, and purpose come together",
                      style: AppTextStyles.label.copyWith(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.60),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // NICHE DROPDOWN
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.06),
                        hintStyle: AppTextStyles.label.copyWith(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      hint: Text(
                        "Ex : Fitness & Health",
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white.withOpacity(0.55),
                        ),
                      ),
                      items: _nicheOptions.map((niche) {
                        return DropdownMenuItem(
                          value: niche,
                          child: Text(
                            niche,
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                      value: _selectedNiche,
                      onChanged: (value) {
                        setState(() {
                          _selectedNiche = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a niche';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 14),
                    Text(
                      "If user did not find their expertise area then enter in a new text field by selecting other from the drop down list",
                      style: AppTextStyles.label.copyWith(
                        fontSize: 12.5,
                        color: Colors.white.withOpacity(0.55),
                        height: 1.35,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // MICRO NICHE SECTION
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.filter_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Micro Niche (Narrow Down Your Focus Area)",
                            style: AppTextStyles.heading2.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Helping Working Moms Stay Fit with Yoga",
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // MICRO NICHE INPUT
                    TextFormField(
                      controller: _microNicheController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.06),
                        hintText:
                            "Ex : Helping Working Moms Stay Fit with Yoga",
                        hintStyle: AppTextStyles.label.copyWith(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Micro niche is required';
                        }
                        if (value.trim().length < 3) {
                          return 'Micro niche must be at least 3 characters';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 35),

                    PrimaryButton(label: "Next", onTap: _onNextPressed),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
