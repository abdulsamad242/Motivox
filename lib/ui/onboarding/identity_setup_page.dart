import 'package:flutter/material.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/inputs/custom_text_field.dart';
import '../../widgets/buttons/primary_button.dart';

class IdentityStepOne extends StatelessWidget {
  const IdentityStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainBackground,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const AppHeader(),

                const SizedBox(height: 22),

                // TOP ROW: progress & fraction
                Row(
                  children: [
                    const Expanded(child: StepProgress(currentStep: 1)),
                    const SizedBox(width: 10),
                    Text(
                      "1/4",
                      style: AppTextStyles.label.copyWith(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // TITLE
                Text(
                  "Welcome aboard, Imtiyaz!",
                  style: AppTextStyles.heading1.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Let’s set up your Motivo journey.",
                  style: AppTextStyles.label.copyWith(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.65),
                  ),
                ),

                const SizedBox(height: 30),

                // SECTION TITLE
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.person,
                          color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Your Basic Identity",
                      style: AppTextStyles.heading2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // NAME LABEL
                Text(
                  "Name",
                  style: AppTextStyles.label.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 6),
                const PrimaryTextField(
                  hint: "Enter Your Name",
                  icon: Icons.person,
                ),

                const SizedBox(height: 18),

                Text(
                  "Email",
                  style: AppTextStyles.label.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 6),
                const PrimaryTextField(
                  hint: "Enter Your Email",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 18),

                Text(
                  "Phone Number",
                  style: AppTextStyles.label.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 6),
                const PrimaryTextField(
                  hint: "Enter Your phone number",
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 30),

                PrimaryButton(label: "Next", onTap: () {}),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
