import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class GratitudeJournal extends StatelessWidget {
  const GratitudeJournal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔵 Global App Header
              const AppHeader(),
              const SizedBox(height: 20),

              // ======================================================
              // 🔥 MAIN HEADER (ICON + TITLE + SUBTITLE)
              // ======================================================
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon Circle
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/icons/giver_gratitude.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Title + Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Gratitude Journal",
                          style: AppTypography.sectionTitle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "A place to revisit what fills your heart.",
                          style: AppTypography.caption.copyWith(
                            fontSize: 13.5,
                            color: Colors.white.withOpacity(0.70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // =====================================================
              // 🔵 MAIN SELECTION CARDS (YESTERDAY • FAMILY • LIFE)
              // =====================================================
              Column(
                children: [
                  _gratitudeOptionCard(
                    icon: "assets/icons/calender.png",
                    title: "Yesterdays Gratitude",
                    subtitle:
                        "Looking Back with Gratitude Reflect on the moments that made yesterday meaningful.",
                    onTap: () {
                      context.push('/yesterday');
                    },
                  ),
                  const SizedBox(height: 14),

                  _gratitudeOptionCard(
                    icon: "assets/icons/family.png",
                    title: "My Family Gratitude",
                    subtitle:
                        "Grateful for My Family Appreciate the love, care, and support they bring to your life.",
                    onTap: () {
                      context.push('/family');
                    },
                  ),
                  const SizedBox(height: 14),

                  _gratitudeOptionCard(
                    icon: "assets/icons/life_gratitude.png",
                    title: "My Life Gratitude",
                    subtitle:
                        "Thankful for My Journey Celebrate how far you’ve come and the person you’re becoming.",
                    onTap: () {
                      context.push('/life');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // =====================================================
              // 🔵 MORNING NOTE SECTION
              // =====================================================
              _morningNoteSection(context),

              // 👉 NEXT CONTENT WILL BE ADDED BELOW
            ],
          ),
        ),
      ),
    );
  }
}

Widget _gratitudeOptionCard({
  required String icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          // ⭐ Left Icon
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.14),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Image.asset(icon, width: 28, height: 28)),
          ),

          const SizedBox(width: 12),

          // ⭐ Title + Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTypography.caption.copyWith(
                    fontSize: 13.2,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),

          // ⭐ Chevron Icon — vertically centered
          Icon(
            Icons.chevron_right,
            color: Colors.white.withOpacity(0.85),
            size: 26,
          ),
        ],
      ),
    ),
  );
}

Widget _morningNoteSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -------------------------
        // HEADER (TITLE + SUBTITLE + + BUTTON)
        // -------------------------
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✦ Title + Sub
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Morning Note",
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Reflect on your sleep and set the tone for a productive day",
                    style: AppTypography.caption.copyWith(
                      fontSize: 13.2,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                ],
              ),
            ),

            // ✦ + BUTTON
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 134, 31, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ],
        ),

        const SizedBox(height: 18),

        // -------------------------
        // 2 x 2 GLASS GRID
        // -------------------------
        Row(
          children: [
            Expanded(child: _glassChip("Hours Slept: 7.5 hrs")),
            const SizedBox(width: 10),
            Expanded(child: _glassChip("Bedtime: 11:30 PM")),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _glassChip("Sleep Quality: Good 😴")),
            const SizedBox(width: 10),
            Expanded(child: _glassChip("Wake Up: 7:00 AM")),
          ],
        ),

        const SizedBox(height: 20),

        // -------------------------
        // CTA BUTTON
        // -------------------------
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(255, 134, 31, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              elevation: 0,
            ),
            child: Text(
              "Write a Morning Note Now",
              style: AppTypography.button.copyWith(fontSize: 15.3),
            ),
          ),
        ),

        // -------------------------
        // FORM INPUTS
        // -------------------------
        const SizedBox(height: 22),

        Text(
          "Hours Slept",
          style: AppTypography.bodySmall.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        _glassInput("Enter your hours slept"),

        const SizedBox(height: 14),

        Text(
          "Bed Time",
          style: AppTypography.bodySmall.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        _glassInput("Enter your bed time"),

        const SizedBox(height: 14),

        // ---- Sleep Quality ----
        Text(
          "Sleep Quality",
          style: AppTypography.bodySmall.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        _sleepQualitySelector(),

        const SizedBox(height: 14),

        Text(
          "Wake Up",
          style: AppTypography.bodySmall.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        _glassInput("Enter your wake time"),

        const SizedBox(height: 24),

        // -------------------------
        // SAVE BUTTON
        // -------------------------
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () => context.go('/productivity'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(255, 134, 31, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: Text(
              "Save",
              style: AppTypography.button.copyWith(fontSize: 15.3),
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    ),
  );
}

Widget _glassChip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.12),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: AppTypography.bodySmall.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget _glassInput(String hint) {
  const double fontSize = 15;

  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.14),
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: Colors.white.withOpacity(0.28)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      style: AppTypography.bodySmall.copyWith(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.transparent,
        filled: false,
        hintStyle: AppTypography.bodySmall.copyWith(
          // ← same style
          color: Colors.white.withOpacity(0.75),
          fontSize: fontSize,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget _sleepQualitySelector() {
  return Container(
    height: 55,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: Colors.white.withOpacity(0.28)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      children: [
        // Emoji Circle
        Container(
          padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.20),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Row(
            // ← wraps both widgets
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("😊", style: TextStyle(fontSize: 20)),
              SizedBox(width: 8), // small gap between emoji and arrow
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white70,
                size: 22,
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        Text(
          "Good",
          style: AppTypography.bodyMedium.copyWith(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
