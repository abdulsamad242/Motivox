import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

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
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 10),

            /// -----------------------------------------------------
            ///             PERFECT MOTIVOX HEADER (REUSED)
            /// -----------------------------------------------------
            _buildMotivoxHeader(statusBar),

            const SizedBox(height: 24),

            /// -----------------------------------------------------
            ///            GOALS TITLE (Inside header already)
            /// -----------------------------------------------------

            /// -----------------------------------------------------
            ///                   GOALS LIST
            /// -----------------------------------------------------
            _goalItem(
              title: "Reminders/Daily Tasks",
              icon: "assets/icons/reminder.png",
              onTap: () => context.push('/sleepScreen'),
            ),

            _goalItem(
              title: "My Life Goals",
              icon: "assets/icons/goals_home_page.png",
              onTap: () => context.push('/goals'),
            ),

            _goalItem(
              title: "Yearly Goals",
              icon: "assets/icons/yearly_goals.png",
              onTap: () => context.push('/yearly'),
            ),

            _goalItem(
              title: "Quarterly Goals",
              icon: "assets/icons/quarterly_goals.png",
              onTap: () => context.push('/quarterly'),
            ),

            _goalItem(
              title: "Monthly Goals",
              icon: "assets/icons/monthly_goals.png",
              onTap: () => context.push('/monthly'),
            ),

            _goalItem(
              title: "Weekly Goals",
              icon: "assets/icons/weekly_goals.png",
              onTap: () => context.push('/weekly'),
            ),

            _goalItem(
              title: "Daily Goals",
              icon: "assets/icons/daily_goals.png",
              onTap: () => context.push('/daily'),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------------------
  //                           HEADER (Perfect Motivox Header)
  // ----------------------------------------------------------------------
  Widget _buildMotivoxHeader(double statusBar) {
    return Container(
      padding: EdgeInsets.only(
        top: (statusBar - 40).clamp(0, double.infinity),
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
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),

          /// ------------------- GLASS ROW ---------------------
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/logo.png", height: 56),

                    const Spacer(),

                    // ---- Progress Circle ----
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            value: 0.60,
                            strokeWidth: 6,
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation(
                              Color(0xFFFF9001),
                            ),
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
                    _circleIcon("assets/icons/rem.png"),
                    const SizedBox(width: 12),
                    _circleIcon("assets/icons/set.png"),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          /// ------------------- TITLE GLASSCARD ---------------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "Goals",
              style: AppTypography.title.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(String asset) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(asset, width: 24, height: 24, color: Colors.white),
      ),
    );
  }

  // ----------------------------------------------------------------------
  //                             GLASSCARD GOAL ITEM
  // ----------------------------------------------------------------------
  Widget _goalItem({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Row(
            children: [
              // ---- Icon Circle ----
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.18),
                ),
                child: Center(child: Image.asset(icon, width: 30, height: 30)),
              ),

              const SizedBox(width: 16),

              // ---- Title ----
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
