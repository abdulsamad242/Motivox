import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/routes/app_routes.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/app_header.dart';
import '../../widgets/buttons/primary_button.dart';

class WhySummaryPage extends StatelessWidget {
  const WhySummaryPage({super.key});

  // ---------------------------------------------------------------------------
  // CARD BUILDER (updated brightness + spacing exactly like mockup)
  // ---------------------------------------------------------------------------
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF314365).withOpacity(0.55), // brighter glass
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.22), // brighter border
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
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
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Value text
          Text(
            value,
            style: AppTextStyles.body.copyWith(
              color: Colors.white.withOpacity(0.90),
              fontSize: 14.5,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.mainBackground),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------------------------------------------------------
                // TOP HEADER CARD (logo)
                //------------------------------------------------------------------
                const AppHeader(),
                const SizedBox(height: 28),

                //------------------------------------------------------------------
                // MAIN TITLE + ICON (mockup-accurate)
                //------------------------------------------------------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 19,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Power Behind My Why",
                            style: AppTextStyles.heading1.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "A reminder of why I started and where I'm heading.",
                            style: AppTextStyles.label.copyWith(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.70),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                //------------------------------------------------------------------
                // INFO CARDS
                //------------------------------------------------------------------
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

                //------------------------------------------------------------------
                // BUTTON
                //------------------------------------------------------------------
                PrimaryButton(
                  label: "View Your Vision Board",
                  onTap: () {
                    context.go(AppRoutes.visionBoard);
                  },
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
