import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_header.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

const Color _orangePrimary = Color.fromRGBO(255, 134, 31, 1);


class ActionDashboard extends StatelessWidget {
  const ActionDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(child:  Stack(
        children: [
          

          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            children: [
              const AppHeader(),
              const SizedBox(height: 18),

              _buildHeaderRow(context),
              const SizedBox(height: 22),

              GlassCard(
                padding: const EdgeInsets.all(16),
                child: _buildDailySummary(),
              ),

              const SizedBox(height: 24),

              GlassCard(
                padding: const EdgeInsets.all(16),
                child: _buildLifetimeGoals(),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      child: _buildProgressCard(
                        title: "Daily Goals\nCompletion",
                        percentage: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      child: _buildProgressCard(
                        title: "Daily To Do\nTasks",
                        percentage: 76,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              GlassCard(
                padding: const EdgeInsets.all(16),
                child: _buildProductivitySection(),
              ),

              const SizedBox(height: 24),

              GlassCard(
                padding: const EdgeInsets.all(16),
                child: _buildGiverSection(),
              ),

              const SizedBox(height: 24),

              GlassCard(
                padding: const EdgeInsets.all(16),
                child: _buildMoodSummarySection(),
              ),

              const SizedBox(height: 24),

              GlassCard(
                padding: const EdgeInsets.all(16),
                child: _buildSleepNoteSection(context),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    ),
    );
  }

  // ─────────────────────────────────────────────
  // 🔶 HEADER ROW
  // ─────────────────────────────────────────────
  Widget _buildHeaderRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Productivity and Action \n Dashboard",
          style: AppTypography.sectionTitle.copyWith(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),

        ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF2196F3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min, // Important: Makes the button only as wide as its children
    // FIX: Text and Image are now separate items in the children list.
    children: [
      Text(
        "Today",
        style: AppTypography.sectionTitle.copyWith(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      
      // Add a small space between the text and the icon
      const SizedBox(width: 6), 

      Image.asset(
        "assets/icons/calendar-2.png",
        width: 20,
        height: 20,
        color: Colors.white,
      ),
    ],
  ),
),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 🔶 DAILY SUMMARY
  // ─────────────────────────────────────────────
  Widget _buildDailySummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Daily Summary and Dashboard",
            style: AppTypography.sectionTitle.copyWith(fontSize: 20)),
        const SizedBox(height: 10),
        Text(
          "Boost your productivity and stay on track by creating your daily To Do list.",
          style: AppTypography.bodySmall.copyWith(color: Colors.white70, fontSize: 14),
        ),
        
        const SizedBox(height: 16),
        _bullet("Stay focused on important tasks"),
        _bullet("Manage your time effectively"),
        _bullet("Achieve your daily goals step by step"),
      ],
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white70,
            ),
            margin: const EdgeInsets.only(right: 12),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodySmall.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 🔶 LIFETIME GOALS
  // ─────────────────────────────────────────────
  Widget _buildLifetimeGoals() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Lifetime Goals", style: AppTypography.sectionTitle),
        const SizedBox(width: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: 0.5,
                strokeWidth: 6,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation(_orangePrimary),
              ),
            ),
            Text("50%", style: AppTypography.sectionTitle.copyWith(fontSize: 18))
          ],
        )
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 🔶 PROGRESS CARD
  // ─────────────────────────────────────────────
  Widget _buildProgressCard({required String title, required int percentage}) {
    return Column(
      children: [
        Text(title,
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: Colors.white,
              fontSize: 14,
            )),
        const SizedBox(height: 12),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 6,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation(_orangePrimary),
              ),
            ),
            Text("$percentage%", style: AppTypography.sectionTitle),
          ],
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 🔶 PRODUCTIVITY SECTION
  // ─────────────────────────────────────────────
  Widget _buildProductivitySection() {
    final items = [
      {"label": "Yearly Goals", "percent": 50},
      {"label": "Quarterly Goals", "percent": 35},
      {"label": "Monthly Goals", "percent": 65},
      {"label": "Weekly Goals", "percent": 47},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Daily Productivity", style: AppTypography.sectionTitle),
        const SizedBox(height: 14),
        ...items.map((e) => _progressRow(
              e['label'] as String,
              e['percent'] as int,
            )),
      ],
    );
  }

  Widget _progressRow(String label, int percent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: AppTypography.bodySmall.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: percent / 100,
                    backgroundColor: Colors.white12,
                    minHeight: 8,
                    valueColor: const AlwaysStoppedAnimation(_orangePrimary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text("$percent%", style: AppTypography.sectionTitle.copyWith(fontSize: 14)),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 🔶 GIVER SECTION
  // ─────────────────────────────────────────────
  Widget _buildGiverSection() {
    final items = [
      {"label": "Gratitude", "percent": 100},
      {"label": "Imagination", "percent": 100},
      {"label": "Visualization", "percent": 60},
      {"label": "Exercise", "percent": 100},
      {"label": "Reading", "percent": 100},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("GIVER", style: AppTypography.sectionTitle),
        const SizedBox(height: 14),
        ...items.map((e) => _progressRow(
              e['label'] as String,
              e['percent'] as int,
            )),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 🔶 MOOD SUMMARY
  // ─────────────────────────────────────────────
  Widget _buildMoodSummarySection() {
  final moods = {
    "Happy": 80,
    "Sad": 100,
    "Angry": 15,
    "Anxiety": 100,
    "Grateful": 55,
  };

  const double chartHeight = 220;
  const double barWidth = 26; // thinner bars
  const double fullBarOpacity = 0.10; // grey background bar

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "Daily Mood Summary",
        style: AppTypography.sectionTitle.copyWith(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 14),

      SizedBox(
        height: chartHeight + 25,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(6, (i) {
                  final value = 100 - (i * 20);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      "$value",
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  );
                }),
              ),
            
            const SizedBox(width: 8),

            // CHART AREA
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  
                    return Stack(
                      children: [
                        // HORIZONTAL LINES (better aligned)
                        ...List.generate(6, (i) {
                          return Positioned(
                            top: (chartHeight / 5) * i,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 1,
                              color: Colors.white.withOpacity(
                                i == 5 ? 0.40 : 0.12,
                              ),
                            ),
                          );
                        }),

                        // VERTICAL GRID LINES
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(moods.length, (i) {
                            return Container(
                              width: 1,
                              height: chartHeight,
                              color: Colors.white.withOpacity(0.10),
                            );
                          }),
                        ),

                        // BARS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: moods.entries.map((e) {
                            return _barWithBackground(
                              label: e.key,
                              value: e.value,
                              width: barWidth,
                              height: chartHeight,
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  
                },
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 18),

      // LEGEND
      Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: _orangePrimary,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.white, width: 1.4), // white border
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "Emotion Type",
              style: AppTypography.bodySmall.copyWith(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


Widget _barWithBackground({
  required String label,
  required int value,
  required double width,
  required double height,
}) {
  final barHeight = (value / 100) * height;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // STACK: Grey background → Orange foreground
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // BACKGROUND BAR (grey filler)
          Container(
            width: width,
            height: height,
            color: Colors.white.withOpacity(0.10),
          ),

          // ORANGE VALUE BAR
          Container(
            width: width,
            height: barHeight,
            color: _orangePrimary,
          ),
        ],
      ),

      const SizedBox(height: 6),

      // Label
      Text(
        label,
        style: AppTypography.bodySmall.copyWith(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    ],
  );
}


  // ─────────────────────────────────────────────
  // 🔶 SLEEP NOTE SECTION
  // ─────────────────────────────────────────────
  Widget _buildSleepNoteSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sleep Note", style: AppTypography.sectionTitle),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => context.go('/sleepNote'),
          style: ElevatedButton.styleFrom(
            backgroundColor: _orangePrimary,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(
            "Write a Sleep Note Now",
            style: AppTypography.sectionTitle.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 🔶 GLASS CARD (INLINE WIDGET)
// ─────────────────────────────────────────────
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
