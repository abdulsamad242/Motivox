// purpose_step_three.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/routes/app_routes.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../onboarding/identity_step_four.dart';

class PurposeStepThree extends StatefulWidget {
  const PurposeStepThree({super.key});

  @override
  State<PurposeStepThree> createState() => _PurposeStepThreeState();
}

class _PurposeStepThreeState extends State<PurposeStepThree> {
  final TextEditingController _missionController = TextEditingController();
  final TextEditingController _visionController = TextEditingController();

  bool _formSubmitted = false; // 👈 Track submit attempt

  @override
  void dispose() {
    _missionController.dispose();
    _visionController.dispose();
    super.dispose();
  }

  String? _validateMission() {
    if (!_formSubmitted) return null; // 👈 Only validate after submit
    final text = _missionController.text.trim();
    if (text.isEmpty) return 'Mission is required';
    if (text.length < 10) return 'Mission should be at least 10 characters';
    return null;
  }

  String? _validateVision() {
    if (!_formSubmitted) return null; // 👈 Only validate after submit
    final text = _visionController.text.trim();
    if (text.isEmpty) return 'Vision is required';
    if (text.length < 10) return 'Vision should be at least 10 characters';
    return null;
  }

  void _onContinuePressed() {
    setState(() {
      _formSubmitted = true;
    });

    // Trigger rebuild to show errors if any
    if (_validateMission() != null || _validateVision() != null) {
      // Errors will now appear below fields
      return;
    }

    context.push(AppRoutes.identityStepfour);
  }

  Widget _buildTextAreaSection({
    required String title,
    required IconData icon,
    required String exampleText,
    required String hintText,
    required TextEditingController controller,
    required String? Function() validator,
  }) {
    String? error = validator(); // Will be null until _formSubmitted = true

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.heading2.copyWith(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF2A3A5C).withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: error != null
                  ? Colors.red
                  : const Color(0xFF4A5D8A).withOpacity(0.5),
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exampleText,
                style: AppTextStyles.label.copyWith(
                  color: Colors.white.withOpacity(0.60),
                  fontSize: 13.5,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3A57).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: error != null
                        ? Colors.red
                        : Colors.white.withOpacity(0.35),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: TextField(
                  controller: controller,
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  cursorColor: const Color(0xFFFF8C42),
                  cursorWidth: 2,
                  cursorHeight: 20,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 14.5,
                    height: 1.5,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: AppTextStyles.label.copyWith(
                      color: Colors.white.withOpacity(0.40),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    isCollapsed: true,
                    counterText: '',
                  ),
                ),
              ),

              // Only show error after submit
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    error,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      height: 1.2,
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
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFFF8C42),
          selectionColor: Color(0x4DFF8C42),
          selectionHandleColor: Color(0xFFFF8C42),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainBackground,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeader(),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Expanded(child: StepProgress(currentStep: 3)),
                      const SizedBox(width: 10),
                      Text(
                        "3/4",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Define Your Purpose",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading1.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Tell us what drives you, so Motivo can guide you every day.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.label.copyWith(
                      fontSize: 14,
                      height: 1.4,
                      color: Colors.white.withOpacity(0.70),
                    ),
                  ),

                  const SizedBox(height: 32),

                  _buildTextAreaSection(
                    title: "Your Mission (Your Goal / Milestone / Why)",
                    icon: Icons.flag,
                    exampleText:
                        'Example: "I want to help 1 million working women stay fit and healthy to live happier lives."',
                    hintText: "Helping people live healthier lives",
                    controller: _missionController,
                    validator: _validateMission,
                  ),

                  const SizedBox(height: 35),

                  _buildTextAreaSection(
                    title:
                        "Your Vision (The Bigger Picture / The Change You Want to Create)",
                    icon: Icons.lightbulb_outline,
                    exampleText:
                        "Ex : To empower working women to build a culture of fitness, confidence, and joy.",
                    hintText: "Share Your dream impact here...",
                    controller: _visionController,
                    validator: _validateVision,
                  ),

                  const SizedBox(height: 35),

                  PrimaryButton(label: "Continue", onTap: _onContinuePressed),

                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
