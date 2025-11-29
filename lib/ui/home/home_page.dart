import 'package:flutter/material.dart';
import 'package:motivix/ui/home/bottom_nav.dart';
import '../../theme/app_typography.dart';
import '../../widgets/app_background.dart';
import '../../widgets/motivox_home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              /// HEADER
              const MotivoxHomeHeader(
                progress: 0.0,
                username: "Alex",
                quote: "The only way to achieve the impossible is to believe it is possible",
              ),
              const SizedBox(height: 24),

              /// MY POSITIONING
              _section(
                icon: "assets/images/compass_icon.png",
                text: "I lead with empathy, strength, and authenticity.\n\"As confident, kind, and committed to making a difference.\"",
                buttonText: "Add Your Positioning",
                onTap: () {},
              ),
              const SizedBox(height: 20),

              /// MY VISION
              _section(
                icon: "assets/images/eye.png",
                text: "“A world where people live with their dreams.”",
                buttonText: "Add Your Vision",
                onTap: () {},
              ),
              const SizedBox(height: 20),

              /// WHAT DRIVES ME
              _drivesSection(
                text: "I am on a mission to help 1 million people build a second source of income from their skills and experience, so they can achieve true freedom and fulfillment.",
                buttonText: "Add Your Mission",
                onTap: () {},
              ),
              const SizedBox(height: 20),

              /// YOUR DAILY GIVER
              _dailyGiver(),
              const SizedBox(height: 24),
              _growthActions(),
const SizedBox(height: 24),
_todayGoals(),
const SizedBox(height: 24),
_reminders(),
const SizedBox(height: 24),
_dailyProductivitySection(),
const SizedBox(height: 24),
_visionBoardSection(),
const SizedBox(height: 24),
_emotionTrackerSection(),
const SizedBox(height: 24),
_dailyDiarySection(),

const SizedBox(height: 100),

            ],
          ),
        ),
      ),
      /// ------- FIXED BOTTOM NAV -------
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  /* ----------  section builders  ---------- */
  Widget _section({
    required String icon,
    required String text,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            icon.contains("compass") ? "My Positioning" : "My Vision for the World",
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            icon.contains("compass")
                ? "Share the change you want to see around you"
                : "Share the change you want to see around you",
            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color.fromRGBO(130, 150, 255, 0.09), Color.fromRGBO(18, 25, 61, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.20), width: 1),
                    image: DecorationImage(image: AssetImage(icon), fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color.fromRGBO(255, 134, 31, 0.29), Color.fromRGBO(69, 98, 255, 0.19)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      border: Border.all(color: Colors.white.withOpacity(0.10), width: 1),
                    ),
                    child: Text(
                      text,
                      style: AppTypography.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9001),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drivesSection({
    required String text,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What Drives Me",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            "Share the actions you’re taking to make your vision real",
            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color.fromRGBO(130, 150, 255, 0.09), Color.fromRGBO(18, 25, 61, 1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color.fromRGBO(255, 134, 31, 0.29), Color.fromRGBO(69, 98, 255, 0.19)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      border: Border.all(color: Colors.white.withOpacity(0.10), width: 1),
                    ),
                    child: Text(
                      text,
                      style: AppTypography.bodySmall,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.20), width: 1),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/plane.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9001),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dailyGiver() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 134, 31, 0.29),
                  Color.fromRGBO(69, 98, 255, 0.19),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------- top row: text + circle --------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // left text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Daily",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "GIVER",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "1/5 Done Complete your\nday of growth",
                      style: AppTypography.white70.copyWith(
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // right circle
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  "assets/images/giver_circle.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // -------- bottom quote card --------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.15),
              border: Border.all(
                color: Colors.white.withOpacity(0.10),
                width: 1,
              ),
            ),
            child: Text(
              "“Growth is an unending process, rooted in everyday effort.”",
              style: AppTypography.bodySmall.copyWith(
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget _growthActions() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
       gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 134, 31, 0.29),
                  Color.fromRGBO(69, 98, 255, 0.19),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1.1,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ---- TITLE ----
          Text(
            "TODAY’S GROWTH ACTONS",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // ---- SUBTITLE ----
          Text(
            "Goals give direction. Reminders keep you consistent",
            style: AppTypography.white70.copyWith(
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          // ---- SECOND LINE ----
          Text(
            "Set your goals. Take action. Stay reminded.",
            style: AppTypography.white70.copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // ---- Illustration ----
          SizedBox(
            width: 260,
            child: Image.asset(
              "assets/images/growth_chart.png", // ⬅️ replace with your correct asset
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget _todayGoals() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 134, 31, 0.29),
                  Color.fromRGBO(69, 98, 255, 0.19),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- HEADER ----------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today’s Goals",
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              // Updated badge → white BG + orange text
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "5/10, 50% Completed",
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 13,
                    color: const Color(0xFFFF9001),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ---------------- PROGRESS BAR ----------------
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 4,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9001),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ---------------- LIST + TIMELINE ----------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- TIMELINE + CHECKBOXES ----
              Column(
                children: [
                  const SizedBox(height: 4),
                  _goalCheckbox(checked: true),
                  _goalConnector(),
                  _goalCheckbox(checked: true),
                  _goalConnector(),
                  _goalCheckbox(checked: false),
                  _goalConnector(),
                  _goalCheckbox(checked: false),
                ],
              ),

              const SizedBox(width: 14),

              // ---- GOAL CARDS ----
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _goalCard("Prepare client presentation", completed: true),
                    _goalCard("Review financial summary", completed: true),
                    _goalCard("Draft follow-up email", completed: false),
                    _goalCard("Practice speech delivery", completed: false),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


Widget _goalCheckbox({required bool checked}) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6), // ← Rounded SQUARE
      color: checked ? const Color(0xFFFF9001) : Colors.transparent,
      border: Border.all(
        color: checked ? const Color(0xFFFF9001) : Colors.white.withOpacity(0.8),
        width: 2,
      ),
    ),
    child: checked
        ? const Icon(Icons.check, size: 16, color: Colors.black)
        : null,
  );
}

Widget _goalConnector() {
  return Container(
    width: 2,
    height: 32,
    color: Colors.white.withOpacity(0.25),
  );
}
Widget _goalCard(String text, {required bool completed}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white.withOpacity(0.06), // Glass effect
      border: Border.all(
        color: Colors.white.withOpacity(0.12),
      ),
    ),
    child: Text(
      text,
      style: AppTypography.bodySmall.copyWith(
        fontSize: 15,
        decoration:
            completed ? TextDecoration.lineThrough : TextDecoration.none,
        color: completed ? Colors.white.withOpacity(0.55) : Colors.white,
        height: 1.3,
      ),
    ),
  );
}

Widget _reminders() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 134, 31, 0.29),
                  Color.fromRGBO(69, 98, 255, 0.19),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1.0,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- HEADER ----------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminders",
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              // White badge with orange text
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "5/10, 50% Completed",
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 13,
                    color: const Color(0xFFFF9001),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ---------------- PROGRESS BAR ----------------
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 4,
                width: 120, // dynamic later
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9001),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ---------------- LIST + TIMELINE ----------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- TIMELINE + CHECKBOXES ----
              Column(
                children: [
                  const SizedBox(height: 10),
                  _goalCheckbox(checked: true),
                  _goalConnector(),
                  _goalCheckbox(checked: true),
                  _goalConnector(),
                  _goalCheckbox(checked: false),
                  _goalConnector(),
                  _goalCheckbox(checked: false),
                ],
              ),

              const SizedBox(width: 14),

              // ---- REMINDER GLASS CARDS ----
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _goalCard("Meeting at 11:30", completed: true),
                    _goalCard("Talk to the employees", completed: true),
                    _goalCard("Pickup the laptop from service at 5:30 pm", completed: false),
                    _goalCard("Talk to wife to pick up child at 6:30 pm", completed: false),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget _dailyProductivitySection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(255, 134, 31, 0.29),
                  Color.fromRGBO(69, 98, 255, 0.19),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1.0,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ---------------- TITLE ----------------
          Text(
            "Daily Productivity, Actions & Insights",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),

          Text(
            "Track your actions. Measure your progress. Fuel your growth.",
            style: AppTypography.white70.copyWith(fontSize: 13),
          ),

          const SizedBox(height: 20),

          // ---------------- CIRCULAR PROGRESS ----------------
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: CircularProgressIndicator(
                    value: 0.72,
                    strokeWidth: 12,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation(Color(0xFFFF9001)),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "72%",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Today's\nEfficiency",
                      textAlign: TextAlign.center,
                      style: AppTypography.white70.copyWith(
                        fontSize: 13,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ---------------- STATS CARDS ----------------
          _statCard(
  iconPath: "assets/icons/q.png",
  title: "Hours Focused",
  value: "4h 20m",
),

          const SizedBox(height: 12),

          _statCard(
  iconPath: "assets/icons/r.png",
  title: "Tasks Completed",
  value: "6/8",
),

          const SizedBox(height: 12),

          _statCard(
  iconPath: "assets/icons/t.png",
  title: "Streak",
  value: "5-day active",
),


          const SizedBox(height: 20),

          // ---------------- MOTIVATION LINE ----------------
          Text(
            "Great work! you’re ahead of yesterday – keep the momentum going.",
            style: AppTypography.white70.copyWith(fontSize: 14),
          ),

          const SizedBox(height: 20),

          // ---------------- BUTTON ----------------
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9001),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "View Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget _statCard({
  required String iconPath,   // <-- now using custom images
  required String title,
  required String value,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white.withOpacity(0.06),
      border: Border.all(
        color: Colors.white.withOpacity(0.12),
      ),
    ),
    child: Row(
      children: [
        // ---- Custom PNG Icon ----
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iconPath),
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(width: 14),

        // ---- Title ----
        Expanded(
          child: Text(
            title,
            style: AppTypography.bodySmall.copyWith(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),

        // ---- Right Value ----
        Text(
          value,
          style: AppTypography.bodySmall.copyWith(
            fontSize: 15,
            color: Colors.white70,
          ),
        ),
      ],
    ),
  );
}

Widget _visionBoardSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 134, 31, 0.29),
            Color.fromRGBO(69, 98, 255, 0.19),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- TITLE ----------------
          Text(
            "My Vision Board",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          // ---------------- 2 CARDS SIDE-BY-SIDE ----------------
          Row(
            children: [
              // -------- LEFT ORANGE CARD --------
              Expanded(child: _identityCard()),

              const SizedBox(width: 12),

              // -------- RIGHT BLUE CARD --------
              Expanded(child: _dreamLifeCard()),
            ],
          ),

          const SizedBox(height: 20),

          // ---------------- BUTTON ----------------
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9001),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Explore My Vision Board",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget _identityCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [
          Color(0xFFFF9001),
          Color(0xFFFFC567),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image + Title
        Row(
  children: [
    Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage("assets/images/profile.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
    const SizedBox(width: 10),

    Expanded(
      child: Text(
        "My Identity",
        style: AppTypography.sectionTitle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    ),
  ],
),

        const SizedBox(height: 14),

        // Identity Items
        _identityItem("I am a Great Character", "assets/icons/o1.png"),
        _identityItem("I am a Great Leader", "assets/icons/o2.png"),
        _identityItem("I am a Great Author", "assets/icons/o3.png"),
        _identityItem("I am a Great Speaker", "assets/icons/o4.png"),
        _identityItem("I am a Great Entrepreneur", "assets/icons/o5.png"),
      ],
    ),
  );
}

Widget _identityItem(String text, String icon) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Image.asset(icon, width: 20, height: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodySmall.copyWith(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    ),
  );
}

Widget _dreamLifeCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [
          Color(0xFF355CFF),
          Color(0xFF79A5FF),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image + Title
        Row(
  children: [
    Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage("assets/images/blue.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
    const SizedBox(width: 10),

    Expanded(
      child: Text(
        "My Dream Life",
        style: AppTypography.sectionTitle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    ),
  ],
),

        const SizedBox(height: 14),

        // Dream Items
        _dreamLifeItem("I want to earn 1 Cr ", "assets/icons/b1.png"),
        _dreamLifeItem("I want to be fit", "assets/icons/b2.png"),
        _dreamLifeItem("I want to visit world", "assets/icons/b3.png"),
        _dreamLifeItem("I want to make relationships", "assets/icons/b4.png"),
        _dreamLifeItem("I want to have business", "assets/icons/b5.png"),
      ],
    ),
  );
}

Widget _dreamLifeItem(String text, String icon) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Image.asset(icon, width: 20, height: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodySmall.copyWith(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    ),
  );
}
Widget _emotionTrackerSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 134, 31, 0.29),
            Color.fromRGBO(69, 98, 255, 0.19),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------- TITLE ----------------
          Text(
            "How are you feeling now?",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),

          // ---------------- SEARCH BAR ----------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.08),
              border: Border.all(color: Colors.white.withOpacity(0.10)),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white.withOpacity(0.6)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Search emotion...",
                    style: AppTypography.white70.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),


          // ---------------- EMOTION GRID ----------------
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.95,
            children: [
              _emotionItem("😊", "Happy", 20),
              _emotionItem("😐", "Neutral", 2),
              _emotionItem("😭", "Sad", 0),

              _emotionItem("😣", "Anxious", 0),
              _emotionItem("😍", "Loved", 2),
              _emotionItem("😎", "Confident", 2),

              _emotionItem("😴", "Tired", 0),
              _emotionItem("😡", "Angry", 0),
              _emotionItem("🙏", "Grateful", 2),

              _emotionItem("🤩", "Excited", 2),
              _emotionItem("😔", "Lonely", 0),
              _emotionItem("😵‍💫", "Confused", 0),
            ],
          ),

          const SizedBox(height: 22),

          // ---------------- SEE LESS BUTTON (FULL WIDTH + BLUE BG) ----------------
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(34, 116, 240, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "See Less",
                    style: AppTypography.white70.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ---------------- MOTIVATION QUOTE (ORANGE) ----------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color.fromRGBO(255, 141, 44, 1),
            ),
            child: Text(
              "“Keep shining, your positivity is contagious!”",
              textAlign: TextAlign.center,
              style: AppTypography.sectionTitle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _emotionItem(String emoji, String label, int count) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white.withOpacity(0.15),
      border: Border.all(color: Colors.white.withOpacity(0.12)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),

            if (count > 0)
              Positioned(
                right: -12,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          label,
          style: AppTypography.white70.copyWith(
            fontSize: 12,
            height: 1.1,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
Widget _dailyDiarySection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 134, 31, 0.29),
            Color.fromRGBO(69, 98, 255, 0.19),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ---------- TOP ROW: IMAGE + TITLE ----------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Image
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/OBJECTS.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Daily Diary",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Write. Reflect. Grow",
                      style: AppTypography.white70.copyWith(
                        fontSize: 14,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ---------- SUBTEXT ----------
          Text(
            "Capture your thoughts, emotions, and wins—anytime, anywhere",
            style: AppTypography.white70.copyWith(
              fontSize: 14,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 22),

          // ---------- BUTTON ----------
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9001),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Write Today’s Entry",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


}