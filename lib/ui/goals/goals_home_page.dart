import 'package:flutter/material.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});
  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final goalTitleController = TextEditingController();
  final dateController = TextEditingController();
  String selectedPriority = "Medium";
  String reminderRequired = "Yes";
  String ringtone = "Default";

  // Dummy goals list
  final List<Map<String, String>> goals = [
    {"title": "Making €1 DR", "status": "Pending"},
    {"title": "Ready my roof", "status": "Completed"},
    {"title": "Becoming An Author", "status": "Pending"},
    {"title": "Becoming A Leader", "status": "Completed"},
    {"title": "Learning AI Tools", "status": "Pending"},
  ];

  final Map<String, Color> statusColors = {
    "Pending": Color(0xFFFFB33D),
    "Completed": Color(0xFF26BA6A),
    "Remove": Color(0xFFF44D4D),
  };

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          children: [
            const SizedBox(height: 10),
            // Header
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
            // My Life Goals + Add button
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.90),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
              child: Row(
                children: [
                  // Avatar Image with rounded background
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.09),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Image.asset(
                "assets/icons/goals_home_page.png", // <-- your PNG
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
            ),
          ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "My Life Goals",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Colors.white, size: 19),
                    label: const Text("Add New Goal", style: TextStyle(fontSize: 15, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C51FC),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // GOAL FORM CARD
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.94),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Goal Title", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                  const SizedBox(height: 7),
                  _roundedInput(controller: goalTitleController, hint: "E.g Making 1 cr"),
                  const SizedBox(height: 14),

                  const Text("Date & Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                  const SizedBox(height: 7),
                  _roundedInput(
                    controller: dateController,
                    hint: "MM/DD/YY",
                    icon: Icons.calendar_today_outlined,
                    readOnly: true,
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      if (picked != null) {
                        dateController.text =
                            "${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}";
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  const Text("Priority", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _priorityPill("Low"),
                      const SizedBox(width: 11),
                      _priorityPill("Medium"),
                      const SizedBox(width: 11),
                      _priorityPill("High"),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Text("Is Reminder Required?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                  const SizedBox(height: 8),
                  _reminderRow(),
                  _ringtoneRow(),

                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9001),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),

            // My Goals List
            const Text(
              "My Goals List",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.92),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 0),
              child: Column(
                children: List.generate(goals.length, (i) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: i == 0 ? 0 : 9, bottom: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        // NO radio
                        title: Text(
                          goals[i]["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _statusChip(goals[i]["status"]!),
                            const SizedBox(width: 7),
                            _removeChip(() {
                              setState(() {
                                goals.removeAt(i);
                              });
                            }),
                          ],
                        ),
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Rounded input with border and optional icon
  Widget _roundedInput({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 15.3,
      ),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 5),
                child: Icon(icon, color: Colors.white54, size: 19),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        filled: false,
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xB8FFFFFF), fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.88), width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.98), width: 1.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.88)),
        ),
      ),
    );
  }

  // Priority pill style with radio circle (NO blue fill, just border & dot)
  Widget _priorityPill(String label) {
    final isSelected = selectedPriority == label;
    return GestureDetector(
      onTap: () => setState(() => selectedPriority = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.transparent,
          border: Border.all(
              color: isSelected
                  ? Colors.white.withOpacity(0.92)
                  : Colors.white.withOpacity(0.67),
              width: isSelected ? 1.7 : 1.1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(isSelected ? 1 : 0.82),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white.withOpacity(isSelected ? 1 : 0.8),
                    width: 1.3),
                color: Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // Is Reminder Required (Yes pill, radio at end)
  Widget _reminderRow() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 2),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white.withOpacity(0.85),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          const Text(
            "Yes",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          // Radio
          Transform.scale(
            scale: 1.17,
            child: Radio<bool>(
              value: true,
              groupValue: true,
              onChanged: (_) {},
              fillColor: MaterialStateColor.resolveWith(
                (states) => states.contains(MaterialState.selected)
                    ? Colors.white
                    : Colors.white.withOpacity(0.26),
              ),
              activeColor: Colors.white,
              splashRadius: 18,
            ),
          ),
        ],
      ),
    );
  }

  // Ringtone pill (full width)
  Widget _ringtoneRow() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 9),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white.withOpacity(0.82),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.music_note, color: Colors.white54, size: 20),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Ringtone",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Text(
            ringtone,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.white.withOpacity(0.70), size: 22),
        ],
      ),
    );
  }

  // Status chip for bottom list
  Widget _statusChip(String status) {
    Color color = statusColors[status]!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  // Remove chip for bottom list
  Widget _removeChip(VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
        decoration: BoxDecoration(
          color: statusColors["Remove"]!.withOpacity(0.13),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: statusColors["Remove"]!, width: 1.2),
        ),
        child: Text(
          "Remove",
          style: TextStyle(
            color: statusColors["Remove"]!,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
