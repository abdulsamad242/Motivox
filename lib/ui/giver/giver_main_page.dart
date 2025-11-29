import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class GiverScreen extends StatelessWidget {
  const GiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: AppBackground(
        
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // ==========================
                //      MOTIVOX HEADER
                // ==========================
                _buildMotivoxHeader(statusBar),

                const SizedBox(height: 30),

                // ==========================
                //        GIVER CARDS
                // ==========================
                InkWell(
  onTap: () => context.go('/gratitudeJournal'),
                child:_giverCard(
                  image: 'assets/icons/giver_gratitude.png',
                  title: "G – Gratitude",
                  description:
                      "Start your day with thankfulness and focus on what’s good. It lifts your mood, calms your mind, and fills your heart with positive energy.",
                ),
),
InkWell(
  onTap: () => context.go('/imagination'),
                child: _giverCard(
                  image: 'assets/icons/giver_imagination.png',
                  title: "I – Imagination",
                  description:
                      "Dream beyond limits — imagination fuels creativity, unlocks new ideas, and helps you see endless possibilities ahead.",
                ),
),
InkWell(
  onTap: () => context.go('/visualization'),
                child: _giverCard(
                  image: 'assets/icons/giver_visualization.png',
                  title: "V – Visualization",
                  description:
                      "See your goals as already achieved in your mind. Believe it, your actions start creating it.",
                ),
),
InkWell(
  onTap: () => context.go('/exercise'),
                child:_giverCard(
                  image: 'assets/icons/giver_exercise.png',
                  title: "E – Exercise",
                  description:
                      "Move your body to power your mind — a few minutes of activity can renew your energy, boost, and motivation.",
                ),
),
InkWell(
  onTap: () => context.go('/reading'),
                child:_giverCard(
                
                  image: 'assets/icons/giver_reading.png',
                  title: "R – Reading",
                  description:
                      "Feed your mind with ideas and inspiration — every new page expands your thoughts and fuels your growth.",
                ),
                ),
InkWell(
  onTap: () => context.go('/sleepNote'),
                child:_giverCard(
                  image: 'assets/icons/giver_sleep.png',
                  title: "Sleep Note",
                  description:
                      "The best way to close your day is gratitude in your mind and peace in your heart. Write your Sleep Note to reflect, release, and rest peacefully.",
                ),
),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      );
    
  }

  // ======================================================
  //                      HEADER
  // ======================================================
  Widget _buildMotivoxHeader(double statusBar) {
    return Container(
      padding: EdgeInsets.only(
        top: statusBar - 20,
        left: 10,
        right: 10,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 37, 49, 71),
            Color.fromARGB(255, 45, 91, 176),
            Color.fromARGB(255, 37, 49, 71),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: Column(
        children: [
          // Frosted row
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/logo.png", height: 50),

                    const Spacer(),

                    // Progress circle
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator(
                            value: 0.6,
                            strokeWidth: 5,
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation(Color(0xFFFF9001)),
                          ),
                        ),
                        Text(
                          "60%",
                          style: AppTypography.sectionTitle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 12),
                    _circleIcon(Icons.notifications_none),
                    const SizedBox(width: 10),
                    _circleIcon(Icons.settings_outlined),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Title container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "GIVER",
              style: AppTypography.title.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.15),
      ),
      child: Icon(icon, size: 24, color: Colors.white),
    );
  }

  // ======================================================
  //                     GIVER CARD
  // ======================================================
  Widget _giverCard({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // LEFT ICON
    Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        image,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      ),
    ),

    const SizedBox(width: 14),

    // TEXT + CENTERED ARROW
    Expanded(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          // TEXT ON THE LEFT
          Padding(
            padding: const EdgeInsets.only(right: 40), // space for arrow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.sectionTitle.copyWith(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: AppTypography.sectionTitle.copyWith(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 13.8,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),

          // PERFECTLY CENTER-RIGHT ARROW
          Icon(
            Icons.chevron_right,
            color: Colors.white54,
            size: 34,
          ),
        ],
      ),
    ),
  ],
)

    );
  }
}
