import 'package:flutter/material.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/buttons/primary_button.dart';

class IdentityStepFour extends StatelessWidget {
  const IdentityStepFour({super.key});

  // Reusable text area section – matching Step 3 design
  Widget _buildTextAreaSection({
    required String title,
    required IconData icon,
    required String exampleText,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with icon
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

        // Example + text input box wrapper
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF2A3A5C).withOpacity(0.40),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF4A5D8A).withOpacity(0.50),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Example text
              Text(
                exampleText,
                style: AppTextStyles.label.copyWith(
                  color: Colors.white.withOpacity(0.60),
                  fontSize: 13.5,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 12),

              // Inner input textarea
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3A57).withOpacity(0.70),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.35),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 12),
                child: TextField(
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
                    decoration: TextDecoration.none,
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
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainBackground,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //------------------------------------------------------------------
                  // HEADER
                  //------------------------------------------------------------------
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

                  //------------------------------------------------------------------
                  // TITLE
                  //------------------------------------------------------------------
                  // TITLE (CENTERED)
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
    "Define how the world sees you your values, voice, and vision.",
    textAlign: TextAlign.center,
    style: AppTextStyles.label.copyWith(
      fontSize: 17,
      height: 1.4,
      color: Colors.white.withOpacity(0.70),
    ),
  ),


                  ),

                  const SizedBox(height: 32),

                  //------------------------------------------------------------------
                  // POSITIONING SECTION
                  //------------------------------------------------------------------
                  _buildTextAreaSection(
                    title: "Positioning (How you want to be seen)",
                    icon: Icons.shield_outlined,
                    exampleText:
                        'Ex : A friendly, inspiring fitness coach who helps working women stay healthy.',
                    hintText:
                        "The trusted fitness for busy professionals etc.",
                  ),

                  const SizedBox(height: 35),

                  //------------------------------------------------------------------
                  // BRANDING SECTION
                  //------------------------------------------------------------------
                  _buildTextAreaSection(
                    title: "Branding (Your identity & style)",
                    icon: Icons.person_outline,
                    exampleText:
                        "Ex : Positive, calm, and empowering energy in everything I do.",
                    hintText: "Describe your personal style and tone.",
                  ),

                  const SizedBox(height: 35),

                  //------------------------------------------------------------------
                  // SUBMIT BUTTON
                  //------------------------------------------------------------------
                  PrimaryButton(
                    label: "Submit",
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
