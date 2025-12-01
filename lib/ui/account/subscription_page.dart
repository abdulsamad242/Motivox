import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const AppHeader(),
              const SizedBox(height: 15),

              // -------------------------------
              // TOP HEADER
              // -------------------------------
              Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // icon with frosted background
    Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Image.asset(
        "assets/icons/subs.png",
        width: 20,
        height: 20,
        color: Colors.white,
      ),
    ),

    const SizedBox(width: 12), // space between icon and text

    // text outside the container
    Text(
      "Subscription Plan",
      style: AppTypography.title.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  ],
),

              const SizedBox(height: 20),

              // ===============================
              // FREE TRIAL BIG CARD
              // ===============================
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    // Background Image
                    Image.asset(
                      "assets/images/subscription_bg.png",
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),

                    // Subtle dark overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.28),
                              Colors.black.withOpacity(0.05),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),
                    ),

                    // CONTENT
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Row(
                          children: [
                            // Left Text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "START FOR FREE",
                                    style: AppTypography.sectionTitle.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Experience motivation redefined. 7 days free trial.",
                                    style: AppTypography.bodySmall.copyWith(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Premium Progress Circle
                            _PremiumProgressCircle(percent: 0.72),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===============================
              // MONTHLY PLAN
              // ===============================
              _subscriptionCard(
                iconPath: "assets/icons/monthly.png",
                title: "Monthly",
                price: "₹299 / month",
                tagline: "STAY CONSISTENT. GROW DAILY",
                buttonText: "Start Free Trial",
                saveTag: "Stay Consistent. Build Habits. Grow Daily.",
                features: const [
                  "Positivity and GIVER Tracker",
                  "Daily Productivity Dashboard",
                  "Manage Your Daily Tasks & Reminders",
                  "Set and Manage Your Life Goals",
                  "Write Your Daily Diary & Thoughts",
                  "Access Your AI Buddy",
                ],
                subtitles: const [
                  "Stay inspired and track how you give back daily",
                  "See your progress and stay focused on what matters",
                  "Never miss what's important.",
                  "Break dreams into achievable steps.",
                  "Reflect, release, and grow daily",
                  "Get clarity & guidance instantly.",
                ],
                iconNumbers: [1, 2, 3, 4, 5, 6]
              ),

              const SizedBox(height: 25),

              // ===============================
              // YEARLY
              // ===============================
              _subscriptionCard(
                iconPath: "assets/icons/yearly.png",
                title: "Yearly",
                price: "₹2,499 / year",
                tagline: "COMMIT FOR A YEAR. TRANSFORM FOR LIFE.",
                saveTag: "(Save 30%)",
                buttonText: "Go Yearly & Save 30%",
                features: const [
                  "Everything in Monthly Plan",
                  "Lifetime Habit Tracker",
                  "Priority Support",
                  "Motivational Insights",
                  "FREE Monthly Business Guidance",
                  "Lifetime Community Access",
                ],
                subtitles: const ["", "", "", "", "", ""],
                iconNumbers: [7, 8, 9, 10, 11, 12, 13]
                
              ),

              const SizedBox(height: 25),

              // FOOTER MESSAGE
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Your journey to success starts with a single decision.",
                    style: AppTypography.quote.copyWith(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ===================================================================
  // REUSABLE SUBSCRIPTION CARD
  // ===================================================================
  Widget _subscriptionCard({
  required String iconPath,
  required String title,
  required String price,
  required String tagline,
  required String buttonText,
  required String saveTag,
  required List<String> features,
  required List<String> subtitles,
  required List<int> iconNumbers, // 👈 NEW
}) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          const Color(0xFF4562FF).withOpacity(0.22), // soft blue
          const Color(0xFFFF861F).withOpacity(0.28), // soft orange
        ],
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.18),
              ),
              child: Image.asset(
                iconPath,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                tagline,
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          title,
          style: AppTypography.sectionTitle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),

        Text(
          price,
          style: AppTypography.sectionTitle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        if (saveTag.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              saveTag,
              style: AppTypography.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),

        const SizedBox(height: 18),

        // 🔥 NEW: numbered icons
        for (int i = 0; i < features.length; i++) ...[
          _featureItem(
            numIcon: iconNumbers[i],   // 👈 pass icon number
            title: features[i],
            subtitle: subtitles[i],
          ),
          const SizedBox(height: 10),
        ],

        const SizedBox(height: 18),

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(255, 134, 31, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(double.infinity, 0),
          ),
          child: Text(
            buttonText,
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    ),
  );
}


  // Feature Item
  Widget _featureItem({
  required int numIcon,
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.12),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15),
          ),
          child: Image.asset(
            "assets/icons/$numIcon.png",  // 👈 YOUR NUMBERED ICONS
            width: 22,
            height: 22,
          ),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}

}


// ===================================================================
// PREMIUM GLOSSY PROGRESS CIRCLE
// ===================================================================
class _PremiumProgressCircle extends StatelessWidget {
  final double percent;
  const _PremiumProgressCircle({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.white.withOpacity(0.35),
            Colors.white.withOpacity(0.10),
            Colors.transparent,
          ],
          radius: 0.85,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              value: percent,
              strokeWidth: 6,
              backgroundColor: Colors.white.withOpacity(0.15),
              valueColor: const AlwaysStoppedAnimation(Color(0xFFFF9001)),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${(percent * 100).round()}%",
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Complete",
                style: AppTypography.bodySmall.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
