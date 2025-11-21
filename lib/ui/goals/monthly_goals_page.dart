import 'package:flutter/material.dart';

class MonthlyGoalsPage extends StatefulWidget {
  const MonthlyGoalsPage({super.key});
  @override
  State<MonthlyGoalsPage> createState() => _MonthlyGoalsPageState();
}

class _MonthlyGoalsPageState extends State<MonthlyGoalsPage> {
  final List<String> years = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "July", "Aug", "Sep", "Oct", "Nov","Dec"];
  String selectedYear = "Sep";

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

  final List<Map<String, String>> yearlyGoals = [
    {"title": "Preparing a Coaching Program", "status": "Pending"},
    {"title": "Building Product and Service", "status": "Completed"},
    {"title": "Designing a Landing Page", "status": "Pending"},
    {"title": "Setup a Sales Funnel", "status": "Completed"},
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          children: [
            const SizedBox(height: 10),
            // Header
            Container(
              height: 90,
              margin: const EdgeInsets.only(bottom: 12),
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
                  "assets/images/logo.png", // Replace with your app logo
                  height: 60,
                ),
              ),
            ),
            // Yearly Goals Header + Add New
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.93),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              child: Row(
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
                        'assets/icons/monthly_goals.png',
                        width: 27,
                        height: 27,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: Text(
                      "My Monthly Goals",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Colors.white, size: 19),
                    label: const Text(
                      "Add New",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C51FC),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- Goal Form Card ---
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.96),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dropdown select field
                  const Text("Select the Goal from Drop Down List", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.7)),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Colors.white.withOpacity(0.34), width: 1.1),
                      color: Colors.white.withOpacity(0.04),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: cardColor,
                        value: dropDownValue.isEmpty ? null : dropDownValue,
                        hint: Text(
                          "Suppose Making 1 CH",
                          style: TextStyle(color: Colors.white54, fontSize: 15.3, fontWeight: FontWeight.w500),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white54),
                        items: dropDownGoals
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                  ),
                                ))
                            .toList(),
                        onChanged: (v) => setState(() => dropDownValue = v ?? ''),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Goal Title
                  const Text("Goal Title", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 7),
                  _roundedInput(controller: goalTitleController, hint: "E.g Making 1 cr"),
                  const SizedBox(height: 14),

                  // Date & Time
                  const Text("Date & Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
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
                        dateController.text = "${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}";
                      }
                    },
                  ),
                  const SizedBox(height: 13),

                  // Priority
                  const Text("Priority", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
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
                  const SizedBox(height: 14),

                  // Reminder required
                  const Text("Is Reminder Required?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 9),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Colors.white.withOpacity(0.33), width: 1.1),
                      color: Colors.transparent,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Yes",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Radio<bool>(
                          value: true,
                          groupValue: reminderRequired,
                          onChanged: (v) => setState(() => reminderRequired = true),
                          activeColor: Color.fromARGB(255, 254, 254, 255),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 13),

                  // Ringtone pill
                  _ringtonePill(),

                  const SizedBox(height: 16),
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
            const SizedBox(height: 16),

            // --- Year Selector: All in one container, blue pill for selected ---
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
                      const Text(
                        "Monthly Goals",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C51FC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
                        child: Row(
                          children: [
                            Text(
                              selectedYear.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
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
                    ],
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: years.map((y) {
                        final bool isSelected = y == selectedYear;
                        return GestureDetector(
                          onTap: () => setState(() => selectedYear = y),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF2C51FC) : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? const Color(0xFF2C51FC) : Colors.transparent,
                                width: 1.3,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                            child: Text(
                              y.toString(),
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.white.withOpacity(0.86),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // --- Yearly Goals List in Main Container ---
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.96),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.13), width: 1.1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    child: Text(
                      "My Monthly Goals List",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: List.generate(yearlyGoals.length, (i) {
                      return Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, top: i == 0 ? 0 : 9, bottom: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              yearlyGoals[i]["title"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _statusChip(yearlyGoals[i]["status"]!),
                                const SizedBox(width: 8),
                                _removeChip(() {
                                  setState(() {
                                    yearlyGoals.removeAt(i);
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
                ],
              ),
            ),
            const SizedBox(height: 40),
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
          borderSide: BorderSide(color: Colors.white.withOpacity(0.65), width: 1.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.93), width: 1.4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
        ),
      ),
    );
  }

  // Priority pill style
  Widget _priorityPill(String label) {
    final isSelected = selectedPriority == label;
    return GestureDetector(
      onTap: () => setState(() => selectedPriority = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.transparent,
          border: Border.all(
              color: isSelected
                  ? Color.fromARGB(255, 252, 252, 253)
                  : Colors.white.withOpacity(0.39),
              width: isSelected ? 1.6 : 1.1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Color.fromARGB(255, 253, 253, 253) : Colors.white70,
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
                    color: isSelected
                        ? Color.fromARGB(255, 249, 249, 251)
                        : Colors.white.withOpacity(0.54),
                    width: 1.3),
                color: Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 248, 249, 249),
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

  // Ringtone pill (full width)
  Widget _ringtonePill() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 7),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white.withOpacity(0.38),
          width: 1.1,
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
            ringtoneController.text,
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
