import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class ImaginationScreen extends StatefulWidget {
  const ImaginationScreen({super.key});

  @override
  State<ImaginationScreen> createState() => _ImaginationScreenState();
}

class _ImaginationScreenState extends State<ImaginationScreen> {
  final List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  String selectedMonth = "August";
  int selectedDay = DateTime.now().day;

  final TextEditingController imaginationController = TextEditingController();

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
                      'assets/icons/giver_imagination.png',
                      width: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Imagination",
                        style: AppTypography.sectionTitle
                            .copyWith(fontSize: 22)),
                    Text(
                      "Everything starts with a thought — imagine boldly.",
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
                '"THE MORE YOU IMAGINE, THE MORE ALIVE YOUR WORLD BECOMES."',
                textAlign: TextAlign.center,
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // =============================
            // IMAGINATION GLASS CARDS
            // =============================
            const _ImaginationGlassCard(
              text:
                  "Do you know what every successful person has in common? The power of imagination. They dare to dream big, visualize how those dreams can become reality, and then work tirelessly—day and night—until they achieve success. If you can’t dream it and imagine it, you'll never be able to make it happen, right?",
            ),
            const SizedBox(height: 12),
            const _ImaginationGlassCard(
              text:
                  "That’s why it’s so important to dream boldly and imagine vividly. Think about what you truly want to achieve in your life or career. Picture it in detail, see yourself living that reality, and believe it's possible.",
            ),
            const SizedBox(height: 12),
            const _ImaginationGlassCard(
              text:
                  "Now, take a moment to write down your imagination—in at least 1000 characters. Remember, your imagination doesn’t have to stay the same every day. It can grow, shift, and evolve with new perspectives and fresh approache",
            ),

            const SizedBox(height: 20),

            // =============================
            // MONTH + DATE SELECTOR (NEW DESIGN)
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
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white60,
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
            // TEXTFIELD WITH WR ICON
            // =============================
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                    color: Colors.white.withOpacity(0.32), width: 1.1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsetsGeometry.only(top: 8),
                  child: Image.asset(
                    'assets/icons/wr.png',
                    width: 28,
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: imaginationController,
                      minLines: 6,
                      maxLines: 10,
                      style: AppTypography.bodyMedium.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        filled: false,
                        hintText: "1000 Characters only...",
                        hintStyle: AppTypography.caption.copyWith(
                          color: Colors.white.withOpacity(0.72),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =============================
            // SAVE BUTTON
            // =============================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/giverMain'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 134, 31, 1),
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
// GLASS CARD FOR IMAGINATION PARAGRAPHS
// ======================================================
class _ImaginationGlassCard extends StatelessWidget {
  final String text;
  const _ImaginationGlassCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: Colors.white.withOpacity(0.15), width: 1.1),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(
                color: Colors.white,
                fontSize: 14.6,
                height: 1.42,
              ),
            ),
          ),

          // ICONS
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                Image.asset('assets/icons/pencil.png', width: 22),
                const SizedBox(width: 10),
                Image.asset('assets/icons/de.png', width: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
