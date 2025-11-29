import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../theme/app_typography.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';

class VisualizationScreen extends StatefulWidget {
  const VisualizationScreen({super.key});

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  final List<String> months = [
    "January","February","March","April","May","June","July","August","September","October","November","December"
  ];

  String selectedMonth = "August";
  int selectedDay = DateTime.now().day;

  final TextEditingController goalController = TextEditingController();

  final List<Map<String, String>> visualizationSteps = [
    {"text": "After imagination, the next step is visualization—seeing clearly how you're going to achieve your goals. Don’t just picture the end result, but visualize every detail, from the smallest step to the biggest milestone, as if you're already living it. Visualization is nothing but rehearsing your execution steps in your mind before they happen in reality.", "id": "1"},
    {"text": "Think about it—before every major achievement, successful people first visualize their journey in their mind. Then, they break it down into actionable steps, which eventually become their goals.", "id": "2"},
    {"text": "The power of visualization is truly incredible. It works in every area of your life, guiding you, motivating you, and preparing you for success.", "id": "3"},
    {"text": "So, start practicing visualization today. Write down your steps in detail—at least 800 to 1000 characters—on how you are going to achieve your goals and targets for the day. This simple practice can transform your imagination into reality.", "id": "4"},
   
  ];

  // Month Days Logic
  int _daysInMonth(String month) {
    int monthIndex = months.indexOf(month) + 1;
    int year = DateTime.now().year;
    return DateTime(year, monthIndex + 1, 0).day;
  }

  List<String> get daysList {
    int total = _daysInMonth(selectedMonth);
    return List.generate(total, (i) {
      final date = DateTime(DateTime.now().year, months.indexOf(selectedMonth) + 1, i + 1);
      return "${i + 1} ${DateFormat('E').format(date)}";
    });
  }

  void _showMonthSelector() async {
    String? selected = await showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        backgroundColor: const Color(0xFF212A49),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: Text("Select Month",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 17,
              color: Colors.white,
            )),
        children: months.map((m) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(ctx, m),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                m,
                style: AppTypography.bodyMedium.copyWith(
                  fontSize: 16,
                  color: m == selectedMonth ? const Color(0xFF2C51FC) : Colors.white,
                  fontWeight: m == selectedMonth ? FontWeight.bold : FontWeight.normal,
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
    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(),
              const SizedBox(height: 10),

              // ---------------- Title Row ----------------
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
                        'assets/icons/giver_visualization.png',
                        width: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Visualization",
                          style: AppTypography.sectionTitle.copyWith(fontSize: 22)),
                      Text(
                        "See it in your mind → hold it in your hand.",
                        style: AppTypography.caption.copyWith(fontSize: 13, height: 1.35),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ---------------- Quote Card ----------------
              Container(
                width: double.infinity,
                height: 130,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.45), width: 1.2),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/sparkling.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  '"SEE IT IN YOUR MIND UNTIL IT BECOMES YOUR REALITY."',
                  textAlign: TextAlign.center,
                  style: AppTypography.sectionTitle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ---------------- Glass Info Cards ----------------
              for (var item in visualizationSteps)
                _VisualizationGlassCard(
                  text: item["text"]!,
                  onDelete: () {},
                  onEdit: () {},
                ),

              const SizedBox(height: 20),

              // =============================
// DATE + MONTH SELECTOR (NEW VERSION)
// =============================
Row(
  children: [
    Text(
      DateFormat('MMM dd, yyyy').format(
        DateTime(DateTime.now().year, months.indexOf(selectedMonth) + 1, selectedDay),
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

const SizedBox(height: 18),

// =============================
// HORIZONTAL DAY SELECTOR (NEW VERSION)
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
      children: List.generate(daysList.length, (i) {
        final isSelected = selectedDay == i + 1;

        return GestureDetector(
          onTap: () => setState(() => selectedDay = i + 1),
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
                  (i + 1).toString(),
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  daysList[i].split(" ")[1],
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

              // ---------------- Visualization Text Field ----------------
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white.withOpacity(0.32), width: 1.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 8),
                      child: Image.asset('assets/icons/wr.png', width: 26)),
                    const SizedBox(width: 10),

                    Expanded(
                      child: TextField(
                        controller: goalController,
                        minLines: 6,
                        maxLines: 10,
                        style: AppTypography.bodyMedium.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "800 – 1000 Characters only",
                          fillColor: Colors.transparent,
                          filled: false,
                          hintStyle: AppTypography.caption.copyWith(
                            color: Colors.white.withOpacity(0.72),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ---------------- Save Button ----------------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/giverMain'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 134, 31, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    elevation: 0,
                  ),
                  child: Text(
                    "Save",
                    style: AppTypography.button.copyWith(
                      fontSize: 16.5,
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
      ),
    );
  }
}

// ---------------------------------------------------------------------
// -------------------- GLASS INFO CARD WIDGET -------------------------
// ---------------------------------------------------------------------

class _VisualizationGlassCard extends StatelessWidget {
  final String text;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _VisualizationGlassCard({
    required this.text,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.1),
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

          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: onEdit,
                  child: Image.asset(
                    'assets/icons/pencil.png',
                    width: 22,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onDelete,
                  child: Image.asset(
                    'assets/icons/de.png',
                    width: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------
// ------------------- MONTH SELECTOR GLASS CARD ------------------------
// ---------------------------------------------------------------------

