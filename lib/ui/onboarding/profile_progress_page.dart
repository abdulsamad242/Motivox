import 'package:flutter/material.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/buttons/primary_button.dart';

class ProfileProgressPage extends StatelessWidget {
  const ProfileProgressPage({super.key});

  // ------- A reusable progress card ---------
  Widget _progressCard({
    required bool isComplete,
    required String title,
    required String subtitle,
    required double percent,
    bool showContinue = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF2A3A5C).withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.14),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ICON
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isComplete
                      ? Colors.green.withOpacity(0.15)
                      : Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isComplete ? Icons.check_circle : Icons.flag,
                  color: isComplete ? Colors.greenAccent : Colors.white,
                  size: 18,
                ),
              ),

              const SizedBox(width: 10),

              // TITLE + STATUS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.heading2.copyWith(
                        color: Colors.white,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.label.copyWith(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ),

              // CONTINUE BUTTON (if not complete)
              if (!isComplete && showContinue)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Continue",
                    style: AppTextStyles.label.copyWith(
                      color: Colors.white,
                      fontSize: 12.5,
                    ),
                  ),
                )
            ],
          ),

          const SizedBox(height: 14),

          // PROGRESS BAR
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 6,
                width: percent,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8C42),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${(percent * 100 ~/ MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width)}%",
              style: AppTextStyles.label.copyWith(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  // ------- Recommendation Box ---------
  Widget _buildRecommendationSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF31415F),
            Color(0xFF3B2E4F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ICON
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  "Based on your completed details, we recommend adding your vision & Mission next – "
                  "it helps you stand about 3x more.",
                  style: AppTextStyles.label.copyWith(
                    fontSize: 13,
                    height: 1.35,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: PrimaryButton(
              label: "Continue...",
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainBackground,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppHeader(),
                const SizedBox(height: 22),

                Text(
                  "Your Profile Progress",
                  style: AppTextStyles.heading1.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Complete your profile to unlock full visibility and features.",
                  style: AppTextStyles.label.copyWith(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),

                const SizedBox(height: 28),

                /// Circular Progress (centered)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        value: 0.6,
                        backgroundColor: Colors.white.withOpacity(0.12),
                        valueColor: const AlwaysStoppedAnimation(
                          Color(0xFFFF8C42),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "60%",
                          style: AppTextStyles.heading1.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Completed",
                          style: AppTextStyles.label.copyWith(
                            color: Colors.white.withOpacity(0.75),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 26),

                /// PROGRESS CARDS
                _progressCard(
                  isComplete: true,
                  title: "Basic Details",
                  subtitle: "Complete",
                  percent: screenWidth,
                ),

                const SizedBox(height: 18),

                _progressCard(
                  isComplete: true,
                  title: "Niche & Micro Niche",
                  subtitle: "Complete",
                  percent: screenWidth,
                ),

                const SizedBox(height: 18),

                _progressCard(
                  isComplete: false,
                  title: "Vision & Mission",
                  subtitle: "In Progress",
                  showContinue: true,
                  percent: screenWidth * 0.30,
                ),

                const SizedBox(height: 18),

                _progressCard(
                  isComplete: false,
                  title: "Positioning & Branding",
                  subtitle: "In Progress",
                  showContinue: true,
                  percent: screenWidth * 0.20,
                ),

                const SizedBox(height: 28),

                /// Correct FIX here
                _buildRecommendationSection(),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
