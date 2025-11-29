import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class ProductivityDashboard extends StatefulWidget {
  const ProductivityDashboard({super.key});

  @override
  State<ProductivityDashboard> createState() => _ProductivityDashboardState();
}

class _ProductivityDashboardState extends State<ProductivityDashboard> {
  final List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  String selectedMonth = "August";
  int selectedDay = DateTime.now().day;

  int _daysInMonth(String month, [int? year]) {
    final monthNum = months.indexOf(month) + 1;
    final y = year ?? DateTime.now().year;
    final nextMonth = monthNum < 12 ? monthNum + 1 : 1;
    final nextYear = monthNum < 12 ? y : y + 1;
    return DateTime(nextYear, nextMonth, 1).subtract(const Duration(days: 1)).day;
  }

  List<String> get days {
    final count = _daysInMonth(selectedMonth);
    return List.generate(
      count,
      (i) => "${i + 1} ${DateFormat('E').format(DateTime(2024, months.indexOf(selectedMonth) + 1, i + 1))}",
    );
  }

  void _showMonthSelector() async {
    final selected = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        backgroundColor: const Color(0xFF1F2347),
        title: Text("Select Month", style: AppTypography.sectionTitle),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        children: months.map((m) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(ctx, m),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                m,
                style: AppTypography.bodySmall.copyWith(
                  fontSize: 16,
                  color: m == selectedMonth ? const Color(0xFFFF9001) : Colors.white,
                  fontWeight: m == selectedMonth ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );

    if (selected != null) {
      setState(() {
        selectedMonth = selected;
        selectedDay = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final year = now.year;

    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const AppHeader(),
            const SizedBox(height: 10),
// =============================
// PAGE SUBTITLE BELOW HEADER
// =============================
Text(
  "Your Daily Reading & Exercise Summary - Keep Growing Strong!",
  style: AppTypography.sectionTitle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,       // ⬅ removes blue underline
  ),
),

SizedBox(height: 12),
            // =============================
            // DATE + MONTH SELECTOR
            // =============================
            Row(
              children: [
                Text(
                  DateFormat('MMM dd, yyyy').format(
                    DateTime(year, months.indexOf(selectedMonth) + 1, selectedDay),
                  ),
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                InkWell(
  onTap: _showMonthSelector,
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
          selectedMonth,                     // full month name
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
          color: Colors.white,               // ensures correct white icon
        ),
      ],
    ),
  ),
),

              ],
            ),

            const SizedBox(height: 16),

            // =============================
            // HORIZONTAL DAY SELECTOR
            // =============================
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
                    final isSelected = selectedDay == i + 1;

                    return GestureDetector(
                      onTap: () => setState(() => selectedDay = i + 1),
                      child: Container(
                        margin: const EdgeInsets.only(right: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          color: isSelected ? Color.fromRGBO(34, 116, 240, 1)
 : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              (i + 1).toString(),
                              style: AppTypography.bodySmall.copyWith(
                                fontSize: 16,
                                color: Colors.white ,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              DateFormat('E').format(
                                DateTime(year, months.indexOf(selectedMonth) + 1, i + 1),
                              ),
                              style: AppTypography.caption.copyWith(
                                color: isSelected ? Colors.white : Colors.white60,
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

            // =============================
            // EXERCISE CARD (Glass Style)
            // =============================
            _activityCard(
              image: "assets/images/exercise.jpg",
              title: "Exercise",
              icon: "assets/icons/giver_exercise.png",
              person: "Selfie by John",
              location: "Exercised at: Central Park, NY",
              start: "Start Date and Time: 20th August, 7:00 AM",
              end: "Start Date and Time: 20th August, 7:35 AM",
              duration: "35 Minutes",
            ),

            const SizedBox(height: 18),

            // =============================
            // READING CARD
            // =============================
            _activityCard(
              image: "assets/images/reading.jpg",
              title: "Reading",
              icon: "assets/icons/giver_reading.png",
              person: "Selfie by Lisa",
              location: "Read at: Central Park, NY",
              start: "Start Date and Time: 20th August, 8:00 AM",
              end: "Start Date and Time: 20th August, 8:35 AM",
              duration: "30 Minutes",
            ),

            const SizedBox(height: 20),

            // =============================
            // QUOTE CARD
            // =============================
            InkWell(
  onTap: () => context.go('/goalsHome'),
  borderRadius: BorderRadius.circular(14),
  child: Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Text(
      '“Small daily improvements over time lead to stunning results.” - keep it up, You’re building habits that create success!”',
      textAlign: TextAlign.center,
      style: AppTypography.bodyMedium.copyWith(
        color: const Color(0xFF0B1732),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),


            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // REUSABLE ACTIVITY CARD (GLASS + IMAGE OVERLAY)
  // ============================================================
  Widget _activityCard({
    required String image,
    required String title,
    required String icon,
    required String person,
    required String location,
    required String start,
    required String end,
    required String duration,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----- IMAGE -----
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _overlayTag(Icons.person, person),
                        const SizedBox(height: 6),
                        _overlayTag(Icons.location_on, location),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ----- TITLE -----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.18),
                  ),
                  child: Image.asset(icon, width: 24, height: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: AppTypography.sectionTitle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ----- TIME INFO -----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _timeRow(start),
                const SizedBox(height: 6),
                _timeRow(end),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ----- DURATION BOX -----
          Center(
            child: Container(
              width: 220,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.14),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                "Total Duration : $duration",
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),
        ],
      ),
    );
  }

  // ===== Overlay Tag on Image =====
  Widget _overlayTag(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.35),
          ),
          child: Icon(icon, color: Colors.white, size: 14),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: AppTypography.caption.copyWith(
            color: Colors.white,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ===== Time Row =====
  Widget _timeRow(String text) {
    return Row(
      children: [
        Icon(Icons.access_time, color: Colors.white70, size: 18),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTypography.bodySmall.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
