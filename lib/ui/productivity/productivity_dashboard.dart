import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductivityDashboard extends StatefulWidget {
  const ProductivityDashboard({super.key});

  @override
  State<ProductivityDashboard> createState() => _ProductivityDashboardState();
}

class _ProductivityDashboardState extends State<ProductivityDashboard> {
  final List<String> months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];
  String selectedMonth = "Aug";
  int selectedDay = DateTime.now().day;

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
                color: m == selectedMonth ? const Color(0xFF2C51FC) : Colors.white,
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
        selectedDay = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
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

              // ===== TOP HEADER — CENTERED LOGO ONLY =====
              Container(
                height: 90,
                margin: const EdgeInsets.only(bottom: 17),
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
                    "assets/images/logo.png",
                    height: 60,
                  ),
                ),
              ),

              // ===== DATE SELECTOR ROW (OUTSIDE CONTAINER) =====
              Row(
                children: [
                  Text(
                    DateFormat('MMM dd, yyyy').format(
                      DateTime(currentYear, months.indexOf(selectedMonth) + 1, selectedDay)
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
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

              // ===== HORIZONTAL DAY SLIDER IN CONTAINER =====
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF192042),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(days.length, (i) {
                      bool isSelected = selectedDay == i + 1;
                      return GestureDetector(
                        onTap: () => setState(() => selectedDay = i + 1),
                        child: Container(
                          margin: const EdgeInsets.only(right: 3),
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
              ),

              const SizedBox(height: 10),

              // ===== EXERCISE CARD =====
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF212A49),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section with inner padding (margin inside card)
                    Padding(
                      padding: const EdgeInsets.all(8), // ← This creates space between image and card edge
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/exercise.jpg",
                              height: 200,
                              width: 380,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.darken,
                            ),
                            // Text overlays on image
                            Positioned(
                              bottom: 12,
                              left: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                        child: Icon(Icons.person, color: Colors.white, size: 16),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Selfie by John",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                        child: Icon(Icons.location_on, color: Colors.white, size: 16),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Exercised at: Central Park, NY",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Title Section — CUSTOM IMAGE ICON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.2), // ✅ Light white background
                            ),
                            child: Image.asset(
                              "assets/icons/giver_exercise.png", // ✅ Your custom image
                              width: 25,
                              height: 25,
                               // ✅ Tint to white for dark theme
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Exercise",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Time Info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.white.withOpacity(0.7), size: 18),
                              const SizedBox(width: 8),
                              Text(
                                "Start Date & Time : 20th August, 7:00 AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.white.withOpacity(0.7), size: 18),
                              const SizedBox(width: 8),
                              Text(
                                "End Date & Time : 20th August, 7:35 AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Duration Button (Narrower & Centered)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Center(
                        child: Container(
                          width: 220,
                          height: 50,
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Total Duration : 35 Minutes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ===== READING CARD =====
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF212A49),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section with inner padding (margin inside card)
                    Padding(
                      padding: const EdgeInsets.all(8), // ← This creates space between image and card edge
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/reading.jpg",
                              height: 200,
                              width: 380,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.darken,
                            ),
                            // Text overlays on image
                            Positioned(
                              bottom: 12,
                              left: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                        child: Icon(Icons.person, color: Colors.white, size: 16),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Selfie by Lisa",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                        child: Icon(Icons.location_on, color: Colors.white, size: 16),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Read at: Central Park, NY",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Title Section — CUSTOM IMAGE ICON
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.2), // ✅ Light white background
                            ),
                            child: Image.asset(
                              "assets/icons/giver_reading.png", // ✅ Your custom image
                              width: 25,
                              height: 25,
                               // ✅ Tint to white for dark theme
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Reading",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Time Info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.white.withOpacity(0.7), size: 18),
                              const SizedBox(width: 8),
                              Text(
                                "Start Date & Time : 20th August, 8:00 AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.white.withOpacity(0.7), size: 18),
                              const SizedBox(width: 8),
                              Text(
                                "End Date & Time : 20th August, 8:35 AM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Duration Button (Narrower & Centered)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Center(
                        child: Container(
                          width: 220,
                          height: 50,
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Total Duration : 30 Minutes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ===== MOTIVATIONAL QUOTE CARD =====
               Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '"Small daily improvements over time lead to stunning results." — keep it up, You\'re building habits that create success!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF0B1732), // Dark text for readability
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
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