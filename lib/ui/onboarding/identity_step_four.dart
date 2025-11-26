// identity_step_four.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/routes/app_routes.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';
import '../onboarding/why_summary_page.dart'; // ✅ Adjust path if needed

class IdentityStepFour extends StatefulWidget {
  const IdentityStepFour({super.key});

  @override
  State<IdentityStepFour> createState() => _IdentityStepFourState();
}

class _IdentityStepFourState extends State<IdentityStepFour> {
  final TextEditingController _positioningController = TextEditingController();
  final TextEditingController _brandingController = TextEditingController();

  bool _formSubmitted = false;

  @override
  void dispose() {
    _positioningController.dispose();
    _brandingController.dispose();
    super.dispose();
  }

  String? _validatePositioning() {
    if (!_formSubmitted) return null;
    final text = _positioningController.text.trim();
    if (text.isEmpty) return 'Positioning is required';
    if (text.length < 10) return 'Positioning should be at least 10 characters';
    return null;
  }

  String? _validateBranding() {
    if (!_formSubmitted) return null;
    final text = _brandingController.text.trim();
    if (text.isEmpty) return 'Branding is required';
    if (text.length < 10) return 'Branding should be at least 10 characters';
    return null;
  }

  void _onSubmitPressed() {
    setState(() {
      _formSubmitted = true;
    });

    final positioningError = _validatePositioning();
    final brandingError = _validateBranding();

    if (positioningError != null || brandingError != null) {
      // Errors will appear inline — no snackbar needed if you show below fields
      return;
    }

    // All valid → go to summary
    context.push(AppRoutes.summaryPage);
  }

  Widget _buildTextAreaSection({
    required String title,
    required IconData icon,
    required String exampleText,
    required String hintText,
    required TextEditingController controller,
    required String? Function() validator,
  }) {
    String? error = validator();

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
            color: const Color(0xFF2A3A5C).withOpacity(0.40),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: error != null
                  ? Colors.red
                  : const Color(0xFF4A5D8A).withOpacity(0.50),
              width: 2, // Slightly thicker on error
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
                  color: const Color(0xFF2D3A57).withOpacity(0.70),
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
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 14.5,
                    height: 1.45,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: AppTextStyles.label.copyWith(
                      color: Colors.white.withOpacity(0.40),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    isCollapsed: true,
                    counterText: "",
                  ),
                ),
              ),
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
      data: ThemeData.from(colorScheme: Theme.of(context).colorScheme).copyWith(
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
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeader(),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Expanded(child: StepProgress(currentStep: 4)),
                      const SizedBox(width: 10),
                      Text(
                        "4/4",
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: Text(
                      "Build Your Unique Identity",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.heading1.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Center(
                    child: Text(
                      "Define how the world sees you — your values, voice, and vision.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.label.copyWith(
                        fontSize: 14, // 🔸 Fixed: was 17 (too big)
                        height: 1.4,
                        color: Colors.white.withOpacity(0.70),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  _buildTextAreaSection(
                    title: "Positioning (How you want to be seen)",
                    icon: Icons.shield_outlined,
                    exampleText:
                        'Ex : A friendly, inspiring fitness coach who helps working women stay healthy.',
                    hintText:
                        "The trusted fitness coach for busy professionals etc.",
                    controller: _positioningController,
                    validator: _validatePositioning,
                  ),

                  const SizedBox(height: 35),

                  _buildTextAreaSection(
                    title: "Branding (Your identity & style)",
                    icon: Icons.person_outline,
                    exampleText:
                        "Ex : Positive, calm, and empowering energy in everything I do.",
                    hintText: "Describe your personal style and tone.",
                    controller: _brandingController,
                    validator: _validateBranding,
                  ),

                  const SizedBox(height: 35),

                  PrimaryButton(label: "Submit", onTap: _onSubmitPressed),

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
