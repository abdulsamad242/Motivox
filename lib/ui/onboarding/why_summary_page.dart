import 'package:flutter/material.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/buttons/primary_button.dart';

class WhySummaryPage extends StatelessWidget {
  const WhySummaryPage({super.key});

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.heading2.copyWith(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: AppTextStyles.body.copyWith(
              color: Colors.white.withOpacity(0.85),
              fontSize: 14.5,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                // TOP HEADER
                const AppHeader(),
                const SizedBox(height: 26),

                // TITLE
                Text(
                  "The Power Behind My Why",
                  style: AppTextStyles.heading1.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "A reminder of why I started and where I'm heading.",
                  style: AppTextStyles.label.copyWith(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.70),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 28),

                // CARDS
                _buildInfoCard(
                  icon: Icons.explore,
                  title: "Your niche",
                  value: "Entrepreneurship",
                ),

                const SizedBox(height: 18),

                _buildInfoCard(
                  icon: Icons.brightness_low,
                  title: "Your Micro Niche",
                  value: "Providing Item to People",
                ),

                const SizedBox(height: 18),

                _buildInfoCard(
                  icon: Icons.lightbulb_outline,
                  title: "Your vision",
                  value:
                      "Helping people to fulfill their dreams to live a happy and fulfilled life.",
                ),

                const SizedBox(height: 18),

                _buildInfoCard(
                  icon: Icons.flag,
                  title: "Your mission",
                  value:
                      "Helping 1 million people to build second source of income using their skills and knowledge to live a happy and freedom life.",
                ),

                const SizedBox(height: 18),

                _buildInfoCard(
                  icon: Icons.person_outline,
                  title: "Your positioning",
                  value:
                      "As a freedom coach Helping 1 million people to build second source of income using their skills and knowledge to live a happy and freedom life.",
                ),

                const SizedBox(height: 18),

                _buildInfoCard(
                  icon: Icons.workspace_premium_outlined,
                  title: "Your brand",
                  value:
                      "Yet to be decided. It’s all right. Take your time and figure it out.",
                ),

                const SizedBox(height: 35),

                // BUTTON
                PrimaryButton(
                  label: "View Your Vision Board",
                  onTap: () {},
                ),

                const SizedBox(height: 26),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
