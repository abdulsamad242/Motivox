import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LifeGratitudePage extends StatefulWidget {
  const LifeGratitudePage({super.key});

  @override
  State<LifeGratitudePage> createState() => _LifeGratitudePageState();
}

class _LifeGratitudePageState extends State<LifeGratitudePage> {
  DateTime selectedMonth = DateTime.now();
  int selectedDay = DateTime.now().day;
  List<String> gratitudes = [
    "I am grateful for my Client for believing in my product and services and purchasing my service",
    "I am grateful for the HP printer executive for repairing my printer and making my day productive.",
    "I am grateful for my wife and children having fun with me at night.",
    "I am grateful for my Parents for raising and my best upbringings and helping me to achieve my goals and targets."
  ];
  String newGratitude = "";

  void _showMonthPicker() async {
    final now = DateTime.now();
    final months = List.generate(13, (i) {
      final d = DateTime(now.year, now.month - 6 + i, 1);
      return d;
    });

    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        color: const Color(0xff17203a),
        child: ListView(
          shrinkWrap: true,
          children: months.map((m) {
            return ListTile(
              title: Center(
                child: Text(
                  DateFormat('MMMM yyyy').format(m),
                  style: TextStyle(
                    color: m.month == selectedMonth.month && m.year == selectedMonth.year
                        ? Colors.orange
                        : Colors.white,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  selectedMonth = m;
                  selectedDay = 1;
                });
                Navigator.pop(ctx);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  List<DateTime> get daysInMonth {
    final firstDay = DateTime(selectedMonth.year, selectedMonth.month, 1);
    final days = List<DateTime>.generate(
        DateUtils.getDaysInMonth(selectedMonth.year, selectedMonth.month),
        (i) => firstDay.add(Duration(days: i)));
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final days = daysInMonth;
    return Scaffold(
      backgroundColor: const Color(0xFF0B1732),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Header
              const SizedBox(height: 12),
              Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 18),
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

              // Section Header with icon and description
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/life_gratitude.png',
                        width: 27,
                        height: 27,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "My Life Gratitude",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Thankful for My Journey. Celebrate how far you’ve come and the person you’re becoming.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.68),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Hints & Examples (outer + inner box height increased)
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10), // taller
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hints & Examples :",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15), // taller
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.create, size: 19, color: Colors.white.withOpacity(0.65)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Write 5 things that make your life meaningful today.",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.81),
                                fontSize: 14.5,
                                height: 1.45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Date and month selector
              Row(
                children: [
                  Text(
                    DateFormat('MMM d, yyyy').format(
                        DateTime(selectedMonth.year, selectedMonth.month, selectedDay)),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _showMonthPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xFF245CF2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            DateFormat('MMMM').format(selectedMonth),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.calendar_today_outlined, color: Colors.white, size: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Calendar day slider (main container only has border)
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8), // more vertical padding
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 90, // increased height for slider
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  separatorBuilder: (c, i) => const SizedBox(width: 5),
                  itemBuilder: (context, i) {
                    final d = days[i];
                    final isSelected = selectedDay == d.day;
                    return GestureDetector(
                      onTap: () => setState(() => selectedDay = d.day),
                      child: Container(
                        width: 54,
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF245CF2) : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${d.day}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                              ),
                            ),
                            Text(
                              DateFormat('E').format(d),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.80),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 18),

              // Gratitude List
              ...List.generate(gratitudes.length, (i) => _GratitudeCard(
                text: gratitudes[i],
                onEdit: () async {
                  final res = await showDialog<String>(
                    context: context,
                    builder: (ctx) {
                      final ctrl = TextEditingController(text: gratitudes[i]);
                      return AlertDialog(
                        backgroundColor: const Color(0xFF1B2647),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        title: const Text("Edit Gratitude", style: TextStyle(color: Colors.white)),
                        content: TextField(controller: ctrl, style: const TextStyle(color: Colors.white)),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
                          TextButton(onPressed: () => Navigator.pop(ctx, ctrl.text), child: const Text("Save")),
                        ],
                      );
                    },
                  );
                  if (res != null && res.trim().isNotEmpty) {
                    setState(() => gratitudes[i] = res.trim());
                  }
                },
                onDelete: () => setState(() => gratitudes.removeAt(i)),
              )),

              const SizedBox(height: 8),

              // Add More Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF245CF2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() => gratitudes.add(""));
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    " Add More",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Multiline Input Box with Pencil Icon
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF233154).withOpacity(0.67),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Icon(Icons.edit, color: Colors.white.withOpacity(0.52), size: 21),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (val) => setState(() => newGratitude = val),
                        controller: TextEditingController(text: newGratitude),
                        style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.35),
                        minLines: 4,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "write down the gratitude line",
                          hintStyle: TextStyle(color: Colors.white54),
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8C42),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    if (newGratitude.trim().isNotEmpty) {
                      setState(() {
                        gratitudes.add(newGratitude.trim());
                        newGratitude = "";
                      });
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable gratitude card with horizontal icons
class _GratitudeCard extends StatelessWidget {
  final String text;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _GratitudeCard({required this.text, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF233154).withOpacity(0.67),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.chat, color: Colors.white.withOpacity(0.84)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.5,
                height: 1.42,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white70, size: 21),
                onPressed: onEdit,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.white54, size: 21),
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
