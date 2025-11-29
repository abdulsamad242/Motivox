import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class YesterdaysGratitudePage extends StatefulWidget {
  const YesterdaysGratitudePage({super.key});

  @override
  State<YesterdaysGratitudePage> createState() =>
      _YesterdaysGratitudePageState();
}

class _YesterdaysGratitudePageState extends State<YesterdaysGratitudePage> {
  DateTime selectedMonth = DateTime.now();
  int selectedDay = DateTime.now().day;

  List<String> gratitudes = [
    "I am grateful for my Client for believing in my product and services.",
    "I am grateful for the HP printer executive for repairing my printer.",
    "I am grateful for my wife and children enjoying time with me.",
    "I am grateful for my Parents for raising me with love and support."
  ];

  String newGratitude = "";

  // ---------------- MONTH PICKER ------------------
  void _showMonthPicker() async {
    final now = DateTime.now();
    final months = List.generate(13, (i) {
      final date = DateTime(now.year, now.month - 6 + i, 1);
      return date;
    });

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF131B33),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: months.map((m) {
              final isSelected =
                  m.month == selectedMonth.month && m.year == selectedMonth.year;
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedMonth = m;
                    selectedDay = 1;
                  });
                  Navigator.pop(ctx);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Text(
                      DateFormat('MMMM yyyy').format(m),
                      style: AppTypography.bodyMedium.copyWith(
                        fontSize: 17,
                        color: isSelected
                            ? const Color(0xFFFF9001)
                            : Colors.white,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // ---------------- DAYS IN MONTH ------------------
  List<DateTime> get daysInMonth {
    final first = DateTime(selectedMonth.year, selectedMonth.month, 1);
    final count =
        DateUtils.getDaysInMonth(selectedMonth.year, selectedMonth.month);
    return List.generate(count, (i) => first.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final days = daysInMonth;

    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const AppHeader(),
            const SizedBox(height: 10),

            // ---------------- SECTION TITLE ------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // left icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/calender.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yesterdays Gratitude",
                      style: AppTypography.sectionTitle.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Looking Back with Gratitude Reflect on the moments that made yesterday meaningful.",
                        style: AppTypography.caption.copyWith(
                          fontSize: 13,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ---------------- DATE + MONTH PICKER ------------------
Row(
  children: [
    Text(
      DateFormat('MMM dd, yyyy').format(
        DateTime(selectedMonth.year, selectedMonth.month, selectedDay),
      ),
      style: AppTypography.sectionTitle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Spacer(),
    InkWell(
      onTap: _showMonthPicker,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(34, 116, 240, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Row(
          children: [
            Text(
              DateFormat('MMMM').format(selectedMonth),
              style: AppTypography.button.copyWith(
                fontSize: 15,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/icons/calendar-2.png',
              width: 18,
              height: 18,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  ],
),


            const SizedBox(height: 16),

            // ---------------- DAY SLIDER (EXACT MATCH TO PRODUCTIVITY DASHBOARD) ------------------
Container(
  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.15),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white.withOpacity(0.15)),
  ),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(days.length, (i) {
        final d = days[i];
        final isSelected = selectedDay == d.day;

        return GestureDetector(
          onTap: () => setState(() => selectedDay = d.day),
          child: Container(
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromRGBO(34, 116, 240, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  d.day.toString(),
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 16,
                    color:  Colors.white ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('E').format(d),
                  style: AppTypography.caption.copyWith(
                    color:  Colors.white ,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  ),
),


            const SizedBox(height: 20),

            // ---------------- GRATITUDE GLASSCARDS ------------------
            ...List.generate(gratitudes.length, (i) {
              return _GratitudeGlassCard(
                text: gratitudes[i],
                onEdit: () {},
                onDelete: () => setState(() => gratitudes.removeAt(i)),
              );
            }),

            const SizedBox(height: 18),

            // ---------------- ADD MORE BUTTON ------------------
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(34, 116, 240, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => setState(() => gratitudes.add("")),
                icon: const Icon(Icons.add, color: Colors.white),
                label: Text(
                  "Add More",
                  style: AppTypography.button.copyWith(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ---------------- TEXTAREA (with pencil icon) ------------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.18)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsetsGeometry.only(top: 10),
                  child: Image.asset(
                    "assets/icons/pencil.png",
                    width: 22,
                    height: 22,
                    color: Colors.white70,
                  ),),
                  
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
  controller: TextEditingController(text: newGratitude),
  onChanged: (v) => newGratitude = v,
  minLines: 4,
  maxLines: 8,
  style: AppTypography.bodyMedium,
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: "Write down your gratitude line",
    fillColor: Colors.transparent,
    filled: false,
    hintStyle: AppTypography.bodyMedium.copyWith( // ← same size
      color: Colors.white54,
    ),
  ),
),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ---------------- SAVE BUTTON ------------------
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 134, 31, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => context.go('/thank'),

                child: Text(
                  "Save",
                  style: AppTypography.button.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------
// GLASSCARD for Each Gratitude Item
// ----------------------------------------------------------------
class _GratitudeGlassCard extends StatelessWidget {
  final String text;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _GratitudeGlassCard({
    super.key,
    required this.text,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left icon
          Image.asset(
            "assets/icons/grat.png",
            width: 26,
            height: 26,
          ),
          const SizedBox(width: 10),

          // Text
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(
                fontSize: 14.5,
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Actions
          Row(
            children: [
              GestureDetector(
                onTap: onEdit,
                child: Image.asset(
                  "assets/icons/wr.png",
                  width: 22,
                  height: 22,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onDelete,
                child: Image.asset(
                  "assets/icons/del.png",
                  width: 22,
                  height: 22,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
