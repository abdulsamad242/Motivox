import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';

class PurposeStepThree extends StatelessWidget {
  const PurposeStepThree({super.key});

  Widget _buildTextAreaSection({
    required String title,
    required IconData icon,
    required String exampleText,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
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

        // Outer Container with lighter/brighter appearance
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF2A3A5C).withOpacity(0.4), // Brighter background
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF4A5D8A).withOpacity(0.5), // More visible border
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Example Text - Brighter
              Text(
                exampleText,
                style: AppTextStyles.label.copyWith(
                  color: Colors.white.withOpacity(0.60), // Brighter text
                  fontSize: 13.5,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),

              // Inner Text Area Container - Brighter white border
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3A57).withOpacity(0.7), // Brighter BG
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.35), // Brighter border
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: TextField(
                  minLines: 3,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  cursorColor: const Color(0xFFFF8C42),
                  cursorWidth: 2,
                  cursorHeight: 20,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.95), // Brighter text
                    fontSize: 14.5,
                    height: 1.5,
                    decoration: TextDecoration.none,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: AppTextStyles.label.copyWith(
                      color: Colors.white.withOpacity(0.40), // Brighter hint
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    isCollapsed: true,
                    counterText: '',
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
        // Remove Material underline
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
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeader(),
                  const SizedBox(height: 20),

                  // Progress
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

                  // Title
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

                  // Mission Section
                  _buildTextAreaSection(
                    title: "Your Mission (Your Goal / Milestone / Why)",
                    icon: Icons.flag,
                    exampleText: 'Example: "I want to help 1 million working women stay fit and healthy to live happier lives."',
                    hintText: "Helping people live healthier lives",
                  ),

                  const SizedBox(height: 35),

                  // Vision Section
                  _buildTextAreaSection(
                    title: "Your Vision (The Bigger Picture / The Change You Want to Create)",
                    icon: Icons.lightbulb_outline,
                    exampleText: "Ex : To empower working women to build a culture of fitness, confidence, and joy.",
                    hintText: "Share Your dream impact here...",
                  ),

                  const SizedBox(height: 35),

                  PrimaryButton(
                    label: "Continue",
                    onTap: () {},
                  ),

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