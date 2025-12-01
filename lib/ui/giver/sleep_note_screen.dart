import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class SleepNoteScreen extends StatefulWidget {
  const SleepNoteScreen({super.key});

  @override
  State<SleepNoteScreen> createState() => _SleepNoteScreenState();
}

class _SleepNoteScreenState extends State<SleepNoteScreen> {
  final List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  String selectedMonth = "August";
  int selectedDay = DateTime.now().day;

  final TextEditingController sleepNoteController = TextEditingController();

  // DAYS IN MONTH
  int _daysInMonth(String month, [int? year]) {
    final monthNum = months.indexOf(month) + 1;
    final y = year ?? DateTime.now().year;
    final nextMonth = monthNum < 12 ? monthNum + 1 : 1;
    final nextYear = monthNum < 12 ? y : y + 1;
    return DateTime(nextYear, nextMonth, 1)
        .subtract(const Duration(days: 1))
        .day;
  }

  List<String> get days {
    final count = _daysInMonth(selectedMonth);
    return List.generate(
      count,
      (i) => "${i + 1} ${DateFormat('E').format(
        DateTime(2024, months.indexOf(selectedMonth) + 1, i + 1),
      )}",
    );
  }

  // MONTH SELECTOR POPUP
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
                  color: m == selectedMonth
                      ? const Color(0xFFFF9001)
                      : Colors.white,
                  fontWeight:
                      m == selectedMonth ? FontWeight.bold : FontWeight.w400,
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
            // TITLE ROW
            // =============================
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/giver_sleep.png',  // <-- ADD THIS ICON
                      width: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Today's Diary Note",
                        style: AppTypography.sectionTitle
                            .copyWith(fontSize: 22)),
                    Text(
                      "Your Daily Reflection Buddy",
                      style: AppTypography.caption
                          .copyWith(fontSize: 13, height: 1.35),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // =============================
            // QUOTE CARD
            // =============================
            Container(
              height: 130,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: Colors.white.withOpacity(0.45), width: 1.2),
                image: const DecorationImage(
                  image: AssetImage('assets/images/sparkling.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                '“I AM HAPPY FOR TODAY AND HOPING THE SAME FOR TOMORROW”',
                textAlign: TextAlign.center,
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 16),
            // =============================
            // MONTH + DATE SELECTOR
            // =============================
            Row(
              children: [
                Text(
                  DateFormat('MMM dd, yyyy').format(
                    DateTime(year, months.indexOf(selectedMonth) + 1,
                        selectedDay),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          selectedMonth,
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

            // =============================
            // HORIZONTAL DAY SELECTOR
            // =============================
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: Colors.white.withOpacity(0.15)),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color.fromRGBO(34, 116, 240, 1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              (i + 1).toString(),
                              style: AppTypography.bodySmall.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              days[i].split(" ")[1],
                              style: AppTypography.caption.copyWith(
                                color: 
                                     Colors.white
                                    ,
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
// SEARCH + NOTE TYPE ROW
// =============================
Row(
  children: [
    // SEARCH BAR
    Expanded(
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withOpacity(0.20),
            width: 1.1,
          ),
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/search.png',width: 16,
                          height: 16,
                          color: Colors.white,),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: AppTypography.bodyMedium.copyWith(
                  color: Colors.white,
                  fontSize: 14.5,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search here.",
                  fillColor: Colors.transparent,
                  filled: false,
                  hintStyle: AppTypography.caption.copyWith(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 14.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),

    const SizedBox(width: 10),

    // NOTE TYPE DROPDOWN
    Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.20),
          width: 1.1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: "Note Type",
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          dropdownColor: const Color(0xFF1F2347),
          style: AppTypography.bodyMedium.copyWith(
            color: Colors.white,
            fontSize: 14.5,
          ),
          items: const [
            DropdownMenuItem(value: "Note Type", child: Text("Note Type")),
            DropdownMenuItem(value: "Sleep", child: Text("Sleep")),
            DropdownMenuItem(value: "Mood", child: Text("Mood")),
            DropdownMenuItem(value: "Gratitude", child: Text("Gratitude")),
          ],
          onChanged: (val) {},
        ),
      ),
    ),
  ],
),
const SizedBox(height: 20),

            // =============================
            // INFO GLASS CARDS
            // =============================
            const _SleepNoteGlassCard(
              text:
                  "Life isn’t always easy, but we can make it easier through our behavior, attitude, daily actions, and—most importantly—by learning to manage our emotions.",
            ),
            const SizedBox(height: 12),
            const _SleepNoteGlassCard(
              text:
                  "If you truly want to grow and achieve your dreams, you must learn to understand yourself. And that starts with your emotions. Because if you can’t measure them, you can’t control them. Unless you take time to reflect, you’ll continue repeating the same patterns, carrying the same emotions and mistakes forward.",
            ),
            const SizedBox(height: 12),
            const _SleepNoteGlassCard(
              text:
                  "That’s where your Sleep Note comes in. Think of it as a friend who keeps you on track every day—not just with your goals, but with how you feel and how you interact with others. By observing and writing down your daily emotions, small incidents, and even the tiniest actions before you sleep, you start developing control over yourself.",
            ),
            

            const SizedBox(height: 20),

            // =============================
// DIARY TYPE + TEXT AREA SECTION
// =============================

Text(
  "Select the Diary Note Type",
  style: AppTypography.bodyMedium.copyWith(
    fontSize: 14.5,
    color: Colors.white.withOpacity(0.85),
    fontWeight: FontWeight.w500,
  ),
),

const SizedBox(height: 8),

// ---- GLASS DROPDOWN ----
Container(
  height: 55,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.15),
    borderRadius: BorderRadius.circular(25),
    border: Border.all(
      color: Colors.white.withOpacity(0.20),
      width: 1.1,
    ),
  ),
  child: DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      value: "Sleep Note",
      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      dropdownColor: const Color(0xFF1F2347),
      style: AppTypography.bodyMedium.copyWith(
        fontSize: 15,
        color: Colors.white,
      ),
      items: const [
        DropdownMenuItem(value: "Sleep Note", child: Text("Sleep Note")),
        DropdownMenuItem(value: "Mood Note", child: Text("Mood Note")),
        DropdownMenuItem(value: "Gratitude Note", child: Text("Gratitude Note")),
        DropdownMenuItem(value: "Personal Note", child: Text("Personal Note")),
      ],
      onChanged: (val) {},
    ),
  ),
),

const SizedBox(height: 16),

// ---- LARGE GLASS TEXT AREA ----
Container(
  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.15),
    borderRadius: BorderRadius.circular(25),
    border: Border.all(
      color: Colors.white.withOpacity(0.22),
      width: 1.1,
    ),
  ),
  child: TextField(
    controller: sleepNoteController,
    minLines: 5,
    maxLines: 8,
    style: AppTypography.bodyMedium.copyWith(
      color: Colors.white,
      fontSize: 15,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: "Your Daily Note",
      fillColor: Colors.transparent,
      filled: false,
      hintStyle: AppTypography.caption.copyWith(
        color: Colors.white.withOpacity(0.70),
        fontSize: 15,
      ),
    ),
  ),
),

const SizedBox(height: 20),


            // =============================
            // SAVE BUTTON
            // =============================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/thank'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromRGBO(255, 134, 31, 1),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Save",
                  style: AppTypography.button.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// GLASS CARD FOR SLEEP INFO
// ======================================================
class _SleepNoteGlassCard extends StatelessWidget {
  final String text;
  const _SleepNoteGlassCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.11),
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: Colors.white.withOpacity(0.15), width: 1.1),
      ),
      child: Text(
        text,
        style: AppTypography.bodyMedium.copyWith(
          color: Colors.white,
          fontSize: 14.6,
          height: 1.42,
        ),
      ),
    );
  }
}
