import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';
import 'package:go_router/go_router.dart';
class ThankfulMomentsPage extends StatelessWidget {
  const ThankfulMomentsPage({super.key});

  // 🔵 The gradient for the OUTER big cards
  LinearGradient get mainGradient => LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          const Color(0xFF4562FF).withOpacity(0.22),
          const Color(0xFFFF861F).withOpacity(0.28),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(),
              const SizedBox(height: 14),

              // ============= PAGE TITLE ROW =============
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _circleIcon("assets/icons/moments.png"),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Moments I'm Thankful For",
                            style: AppTypography.sectionTitle.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),
                        const SizedBox(height: 3),
                        Text(
                          "Here are the reasons to live and enjoy your life everyday.",
                          style: AppTypography.caption.copyWith(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // YESTERDAY CARD
              _gratitudeSection(
  icon: "assets/icons/calender.png",
  title: "Yesterday's Gratitude",
  items: const [
    "I'm thankful for a productive meeting.",
    "I enjoyed my morning coffee peacefully.",
    "I learned something new today.",
    "I appreciated help from my colleague.",
    "I had dinner with my family.",
  ],
  buttonText: "View All Yesterday's Gratitudes",
  route: '/yesterday',
  context: context,
),

const SizedBox(height: 18),

_gratitudeSection(
  icon: "assets/icons/family.png",
  title: "My Family Gratitude",
  items: const [
    "I'm grateful for my parents' support.",
    "Thankful for laughter with my kids.",
    "Grateful for my partner's care.",
    "My siblings always encourage me.",
    "Appreciate my family dinners.",
  ],
  buttonText: "View All Family Moments",
  route: '/family',
  context: context,
),

const SizedBox(height: 18),

_gratitudeSection(
  icon: "assets/icons/life_gratitude.png",
  title: "My Life Gratitude",
  items: const [
    "I'm grateful for good health.",
    "I'm thankful for my job opportunities.",
    "I'm proud of my progress.",
    "I cherish time with loved ones.",
    "I'm grateful for every new day.",
  ],
  buttonText: "Explore Life Gratitude",
  route: '/life',
  context: context,
),


              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================
  // REUSABLE GRATITUDE SECTION
  // =====================================================
  Widget _gratitudeSection({
  required String icon,
  required String title,
  required List<String> items,
  required String buttonText,
  required String route,
  required BuildContext context,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
    decoration: BoxDecoration(
      gradient: mainGradient,
      borderRadius: BorderRadius.circular(22),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _circleIcon(icon),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppTypography.sectionTitle.copyWith(
                fontSize: 16.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        ...items.map((e) => _glassItem(e)).toList(),

        const SizedBox(height: 14),

        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => context.go(route),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF9001),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: Text(
              buttonText,
              style: AppTypography.button.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  // =====================================================
  // GLASS ITEM CARD (inner list)
  // =====================================================
  Widget _glassItem(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTypography.bodySmall.copyWith(
          fontSize: 14,
          height: 1.4,
        ),
      ),
    );
  }

  // =====================================================
  // ICON BUBBLE (glass)
  // =====================================================
  Widget _circleIcon(String asset) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Center(
        child: Image.asset(
          asset,
          width: 26,
          height: 26,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
