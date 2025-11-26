import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/routes/app_routes.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/step_progress.dart';
import '../../widgets/inputs/custom_text_field.dart';
import '../../widgets/buttons/primary_button.dart';
import '../onboarding/step_two_growth_area.dart';

class IdentityStepOne extends StatefulWidget {
  const IdentityStepOne({super.key});

  @override
  State<IdentityStepOne> createState() => _IdentityStepOneState();
}

class _IdentityStepOneState extends State<IdentityStepOne> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Email regex — now a RegExp
  static final RegExp _emailPattern = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  // Universal phone validator helper
  String? _validatePhoneNumber(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Phone number is required';
    }

    // Check if input contains any alphabetic character (a-z or A-Z)
    if (RegExp(r'[a-zA-Z]').hasMatch(input)) {
      return 'Alphabets are not allowed in phone number';
    }

    // Remove all non-digit characters (keep only digits for length check)
    String digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');

    // Must be between 7 and 15 digits (ITU standard)
    if (digitsOnly.isEmpty) {
      return 'Phone number must contain digits';
    }
    if (digitsOnly.length < 7) {
      return 'Phone number is too short (minimum 7 digits)';
    }
    if (digitsOnly.length > 15) {
      return 'Phone number is too long (maximum 15 digits)';
    }

    return null; // Valid
  }

  void _onNextPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // Proceed only if valid
      context.push(AppRoutes.identitySteptwo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.mainBackground),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeader(),
                  const SizedBox(height: 22),

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

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
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

                  Text(
                    "Name",
                    style: AppTextStyles.label.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 6),
                  PrimaryTextField(
                    hint: "Enter Your Name",
                    icon: Icons.person,
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      if (value.trim().length < 2) {
                        return 'Name must be at least 2 characters';
                      }
                      if (!RegExp(
                        r"^[a-zA-Z\s\-'.]+$",
                      ).hasMatch(value.trim())) {
                        return 'Name can only contain letters, spaces, hyphens, apostrophes, or dots';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  Text(
                    "Email",
                    style: AppTextStyles.label.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 6),
                  PrimaryTextField(
                    hint: "Enter Your Email",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!_emailPattern.hasMatch(value.trim())) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  Text(
                    "Phone Number",
                    style: AppTextStyles.label.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 6),
                  PrimaryTextField(
                    hint: "Enter phone number (e.g. +1 555 123 4567)",
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    validator: _validatePhoneNumber,
                  ),

                  const SizedBox(height: 30),

                  PrimaryButton(label: "Next", onTap: _onNextPressed),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
