import 'package:flutter/material.dart';
import 'package:motivix/ui/productivity/todo_add_page.dart';
import 'package:motivix/ui/gratitude/life_gratitude_page.dart';
import 'package:motivix/ui/goals/yearly_goals_page.dart';
import 'package:motivix/ui/goals/quarterly_goals_page.dart';
import 'package:motivix/ui/goals/monthly_goals_page.dart';
import 'package:motivix/ui/goals/weekly_goals_page.dart';
import 'package:motivix/ui/goals/daily_goals_page.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              Container(
  margin: const EdgeInsets.only(bottom: 8),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFF374E8C), Color(0xFF223365)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Top Row: Logo + Icons (each in separate rounded containers)
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Logo + Text
          Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 50,
              ),
              const SizedBox(width: 8),
              
            ],
          ),

          // Right: Three Separate Rounded Containers for Icons
          Row(
            children: [
              // Progress Circle Container
              // Progress Circle — No Container, Just ConstrainedBox + Align
Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: CircularProgressIndicator(
                              value: 0.6,
                              strokeWidth: 4,
                              backgroundColor: Colors.white24,
                              valueColor: AlwaysStoppedAnimation(Color(0xFFFF9001)),
                            ),
                          ),
                          const Text(
                            "60%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),

              // Bell Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),

              // Settings Icon Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),

      const SizedBox(height: 16),

      // DAILY TASKS/REMINDERS Banner — Wider & Taller
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.13),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          " Goals",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  ),
),

// DAILY TASKS/REMINDERS Banner

const SizedBox(height: 10),
// --- END: UPDATED HEADER SECTION ---
              const SizedBox(height: 15),

              // ===== GOAL CATEGORY CARDS =====
              Expanded(
                child: ListView(
                  children: [
                    _goalItem(
                      title: "Reminders/Daily Tasks",
                      icon: "assets/icons/reminder.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ToDoListScreen()),
                      ),
                    ),
                    const SizedBox(height: 12),

                    _goalItem(
                      title: "My Life Goals",
                      icon: "assets/icons/goals_home_page.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LifeGratitudePage()),
                      ),
                    ),
                    const SizedBox(height: 12),

                    _goalItem(
                      title: "Yearly Goals",
                      icon: "assets/icons/yearly_goals.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const YearlyGoalsPage()),
                      ),
                    ),
                    const SizedBox(height: 12),

                    _goalItem(
                      title: "Quarterly Goals",
                      icon: "assets/icons/quarterly_goals.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const QuarterlyGoalsPage()),
                      ),
                    ),
                    const SizedBox(height: 12),

                    _goalItem(
                      title: "Monthly Goals",
                      icon: "assets/icons/monthly_goals.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MonthlyGoalsPage()),
                      ),
                    ),
                    const SizedBox(height: 12),

                    _goalItem(
                      title: "Weekly Goals",
                      icon: "assets/icons/weekly_goals.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const WeeklyGoalsPage()),
                      ),
                    ),
                    const SizedBox(height: 12),

                    _goalItem(
                      title: "Daily Goals",
                      icon: "assets/icons/daily_goals.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const DailyGoalsPage()),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== GOALS LIST ITEM WIDGET =====
  Widget _goalItem({
  required String title,
  required String icon,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(14),
      splashColor: const Color(0xFFFF9001).withOpacity(0.3), // Orange splash
      highlightColor: const Color(0xFFFF9001).withOpacity(0.2), // Slight hold color
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15),
              ),
              child: Center(
                child: Image.asset(
                  icon,
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Colors.white.withOpacity(0.65),
            ),
          ],
        ),
      ),
    ),
  );
}
}