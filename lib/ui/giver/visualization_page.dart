import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisualizationScreen extends StatefulWidget {
  const VisualizationScreen({super.key});

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  final List<String> months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];
  String selectedMonth = "Aug";
  int selectedDay = DateTime.now().day;

  final goalTitleController = TextEditingController();
  final dateController = TextEditingController();
  final ringtoneController = TextEditingController(text: "Default");
  String dropDownValue = "";

  String selectedPriority = "Medium";
  bool reminderRequired = false;

  final List<String> dropDownGoals = [
    "Suppose Making 1 CR",
    "Setup a Sales Funnel",
    "Designing a Landing Page",
    "Learning AI Tools",
  ];

  final List<Map<String, String>> monthlyGoals = [
    {"title": "Analyzing Your Skills and Experience", "status": "Pending"},
    {"title": "Finding a problem you can solve", "status": "Completed"},
    {"title": "Analyzing the audience of the Problem", "status": "Pending"},
    {"title": "Analyzing the market for the Pricing", "status": "Pending"},
    {"title": "Thinking About tech Pricing Formats", "status": "Pending"},
  ];

  final Map<String, Color> statusColors = {
    "Pending": Color(0xFFFFB33D),
    "Completed": Color(0xFF26BA6A),
    "Remove": Color(0xFFF44D4D),
  };

  int _daysInMonth(String month, [int? year]) {
    final monthNum = months.indexOf(month) + 1;
    final y = year ?? DateTime.now().year;
    final nextMonth = monthNum < 12 ? monthNum + 1 : 1;
    final nextMonthYear = monthNum < 12 ? y : y + 1;
    return DateTime(nextMonthYear, nextMonth, 1).subtract(const Duration(days: 1)).day;
  }

  List<String> get days {
    final daysInMonth = _daysInMonth(selectedMonth);
    return List.generate(
      daysInMonth,
      (index) => "${index + 1} ${DateFormat('E').format(DateTime(2023, months.indexOf(selectedMonth) + 1, index + 1))}",
    );
  }

  void _showMonthSelector() async {
    final String? selected = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        backgroundColor: const Color(0xFF212A49),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text('Select Month', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        children: months.map((m) => SimpleDialogOption(
          onPressed: () => Navigator.of(ctx).pop(m),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              m,
              style: TextStyle(
                color: m == selectedMonth ? Color(0xFF2C51FC) : Colors.white,
                fontWeight: m == selectedMonth ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
        )).toList(),
      ),
    );
    if (selected != null) {
      setState(() {
        selectedMonth = selected;
        selectedDay = 1; // Reset to first day of selected month
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    final now = DateTime.now();
    final currentYear = now.year;

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // HEADER with logo
              Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF374E8C), Color(0xFF223365)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png", // Your logo asset
                    height: 60,
                  ),
                ),
              ),
              // Top Imagination Info Row
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/giver_visualization.png', // Your image path here
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Visualization",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "If you can see it in your mind, , you can hold it in your hand.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 13.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Sparkling background quote card
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/sparkling.png'), // Your image path here
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  '"SEE IT IN YOUR MIND, UNTIL IT BECOMES YOUR REALITY."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.5,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Imagination Card List
              _ImaginationCard(
                text:
                    "After imagination, the next step is visualization—seeing clearly how you're going to achieve your goals. Don’t just picture the end result, but visualize every detail, from the smallest step to the biggest milestone, as if you're already living it. Visualization is nothing but rehearsing your execution steps in your mind before they happen in reality.",
              ),
              const SizedBox(height: 12),
              _ImaginationCard(
                text:
                    "Think about it—before every major achievement, successful people first visualize their journey in their mind. Then, they break it down into actionable steps, which eventually become their goals.",
              ),
              const SizedBox(height: 12),
              _ImaginationCard(
                text:
                    "The power of visualization is truly incredible. It works in every area of your life, guiding you, motivating you, and preparing you for success.",
              ),
              const SizedBox(height: 12),
              _ImaginationCard(
                text:
                    "So, start practicing visualization today. Write down your steps in detail—at least 800 to 1000 characters—on how you are going to achieve your goals and targets for the day. This simple practice can transform your imagination into reality.",
              ),

              const SizedBox(height: 15),

              // Month & Date Selector Container
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF192042),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          DateFormat('MMM dd, yyyy').format(DateTime(currentYear, months.indexOf(selectedMonth) + 1, selectedDay)),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: _showMonthSelector,
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C51FC),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  selectedMonth,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.5,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(days.length, (i) {
                          bool isSelected = selectedDay == i + 1;
                          return GestureDetector(
                            onTap: () => setState(() => selectedDay = i + 1),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF2C51FC) : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                              child: Column(
                                children: [
                                  Text(
                                    (i + 1).toString(),
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.white.withOpacity(0.86),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    DateFormat('E').format(DateTime(currentYear, months.indexOf(selectedMonth) + 1, i + 1)),
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.white.withOpacity(0.65),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 19),

              // Text area - No background color, just the placeholder
              TextField(
                controller: goalTitleController,
                minLines: 5,
                maxLines: 8,
                
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: "800-1000 Characters only",
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.12),
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  
                  contentPadding: const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.22), width: 1.1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.22), width: 1.1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(19),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.33), width: 1.2),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9001),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.5,
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
// Card style for imagination items
class _ImaginationCard extends StatelessWidget {
  final String text;
  const _ImaginationCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.09),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.1),
      ),
      child: Stack(
        children: [
          // Main text
          Padding(
            padding: const EdgeInsets.only(right: 90), // Adjust padding to avoid overlap with icons
            child: Container(
              width: MediaQuery.of(context).size.width - 40, // Limit the width of the text
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.6,
                  height: 1.42,
                ),
               // Justified text
                overflow: TextOverflow.clip, // Ensures that the text doesn't overflow
              ),
            ),
          ),
          // Edit and Delete buttons at the top-right corner
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.white.withOpacity(0.78), size: 22),
                  splashRadius: 19,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 2),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.white.withOpacity(0.78), size: 22),
                  splashRadius: 19,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

