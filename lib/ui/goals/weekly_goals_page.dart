import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class WeeklyGoalsPage extends StatefulWidget {
  const WeeklyGoalsPage({super.key});

  @override
  State<WeeklyGoalsPage> createState() => _WeeklyGoalsPageState();
}

class _WeeklyGoalsPageState extends State<WeeklyGoalsPage> {
  final List<String> months = const [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  final List<String> weeks = const [
    "1st Week",
    "2nd Week",
    "3rd Week",
    "4th Week",
  ];

  final goalTitleController = TextEditingController();
  final dateController = TextEditingController();
  final ringtoneController = TextEditingController(text: "Default");

  String selectedMonth = "September";
  String selectedWeek = "1st Week";
  String dropDownValue = "";
  String selectedPriority = "Medium";
  bool reminderRequired = false;

  final List<String> dropDownGoals = [
    "Suppose Making 1 CR",
    "Setup a Sales Funnel",
    "Designing a Landing Page",
    "Learning AI Tools",
  ];

  final List<Map<String, String>> weeklyGoals = [
    {"title": "Preparing a Coaching Program", "status": "Pending"},
    {"title": "Building Product and Service", "status": "Completed"},
    {"title": "Designing a Landing Page", "status": "Pending"},
    {"title": "Setup a Sales Funnel", "status": "Completed"},
    {"title": "Learning AI Tools", "status": "Pending"},
  ];

  final Map<String, Color> statusColors = const {
    "Pending": Color(0xFFFFB33D),
    "Completed": Color(0xFF26BA6A),
    "Remove": Color(0xFFF44D4D),
  };

  void _showMonthSelector() async {
    final String? selected = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        backgroundColor: const Color(0xFF1C2344),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: Text("Select Month", style: AppTypography.sectionTitle),
        children: months.map((m) {
          final bool isSelected = m == selectedMonth;
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(ctx, m),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                m,
                style: AppTypography.bodyMedium.copyWith(
                  color: isSelected ? const Color(0xFF2C51FC) : Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
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
      });
    }
  }

  @override
  void dispose() {
    goalTitleController.dispose();
    dateController.dispose();
    ringtoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const AppHeader(),
            const SizedBox(height: 15),

            // =============================
            // TITLE ROW
            // =============================
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.15),
                  width: 1.1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/icons/weekly_goals.png",
                        width: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "My Weekly Goals",
                      style: AppTypography.sectionTitle.copyWith(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(34, 116, 240, 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.add, color: Colors.white, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          "Add New",
                          style: AppTypography.button.copyWith(
                            fontSize: 14.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Text(
              "Select the Goal from Drop Down List",
              style: AppTypography.bodyMedium.copyWith(
                color: Colors.white,
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            // GOAL DROPDOWN
            _glassDropdown(
              items: dropDownGoals,
              value: dropDownValue.isEmpty ? null : dropDownValue,
              hint: "Suppose Making 1 CR",
              onChanged: (v) => setState(() => dropDownValue = v ?? ""),
            ),

            const SizedBox(height: 14),
            // ===================================
            // GLASS CARD: GOAL FORM
            // ===================================
            _glassCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Goal Title
                  Text("Goal Title", style: AppTypography.bodyMedium),
                  const SizedBox(height: 6),
                  _glassInput(goalTitleController, "E.g. Making 1 Cr"),

                  const SizedBox(height: 14),

                  // Date & Time
                  Text("Date & Time", style: AppTypography.bodyMedium),
                  const SizedBox(height: 6),
                  _glassInput(
                    dateController,
                    "MM/DD/YY",
                    icon: Icons.calendar_today,
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
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

                  const SizedBox(height: 14),

                  // Priority
                  Text("Priority", style: AppTypography.bodyMedium),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _priorityPill("Low"),
                      const SizedBox(width: 10),
                      _priorityPill("Medium"),
                      const SizedBox(width: 10),
                      _priorityPill("High"),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Reminder
                  Text(
                    "Is Reminder Required?",
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  _reminderToggle(),

                  const SizedBox(height: 14),

                  // Ringtone
                  _ringtoneTile(),

                  const SizedBox(height: 20),

                  // SAVE BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF861F),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
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
                ],
              ),
            ),

            const SizedBox(height: 16),

            // =============================
            // MONTH + WEEK SELECTOR
            // =============================
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Weekly Goals",
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: _showMonthSelector,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(34, 116, 240, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // =============================
            // HORIZONTAL WEEK SELECTOR
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
                  children: weeks.map((w) {
                    final bool isSelected = w == selectedWeek;
                    return GestureDetector(
                      onTap: () => setState(() => selectedWeek = w),
                      child: Container(
                        margin: const EdgeInsets.only(right: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color.fromRGBO(34, 116, 240, 1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          w,
                          style: AppTypography.bodySmall.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ===================================
            // WEEKLY GOALS LIST
            // ===================================
            _glassCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Weekly Goals List",
                    style: AppTypography.sectionTitle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 14),
                  Column(
                    children: List.generate(weeklyGoals.length, (i) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                weeklyGoals[i]["title"]!,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            _statusChip(weeklyGoals[i]["status"]!),
                            const SizedBox(width: 8),
                            _removeChip(() {
                              setState(() => weeklyGoals.removeAt(i));
                            }),
                          ],
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

  // ============================= UI HELPERS =============================

  Widget _glassCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.14)),
      ),
      child: child,
    );
  }

  Widget _glassDropdown({
    required List<String> items,
    required String? value,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.38), width: 1.1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: const Color(0xFF1A2445),
          value: value,
          hint: Text(
            hint,
            style: AppTypography.hint.copyWith(color: Colors.white70),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: AppTypography.bodyMedium.copyWith(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _glassInput(
    TextEditingController controller,
    String hint, {
    IconData? icon,
    bool readOnly = false,
    Function()? onTap,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: AppTypography.bodyMedium.copyWith(
        color: Colors.white,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: Colors.white54, size: 18)
            : null,
        filled: true,
        fillColor: Colors.white.withOpacity(0.15),
        hintText: hint,
        hintStyle: AppTypography.hint.copyWith(color: Colors.white60),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.40)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.85),
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.38)),
        ),
      ),
    );
  }

 Widget _priorityPill(String label) {
    final isSelected = selectedPriority == label;

    return GestureDetector(
      onTap: () => setState(() => selectedPriority = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.9), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: Colors.white,
                fontSize: 13, // smaller text
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(width: 6),

            Container(
              width: 14, // smaller circle
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.9),
                  width: 1.1,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 7,
                        height: 7,
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


  Widget _reminderToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(0.15),
        border: Border.all(color: Colors.white.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          Text(
            "Yes",
            style: AppTypography.bodyMedium.copyWith(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          Radio<bool>(
            value: true,
            groupValue: reminderRequired,
            onChanged: (v) => setState(() => reminderRequired = true),
            activeColor: const Color(0xFF2C51FC),
          ),
        ],
      ),
    );
  }

  Widget _ringtoneTile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          const Icon(Icons.music_note, color: Colors.white54, size: 20),
          const SizedBox(width: 10),
          Text(
            "Ringtone",
            style: AppTypography.bodyMedium.copyWith(color: Colors.white70),
          ),
          const Spacer(),
          Text(
            ringtoneController.text,
            style: AppTypography.bodyMedium.copyWith(color: Colors.white),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.white70, size: 22),
        ],
      ),
    );
  }

  Widget _statusChip(String status) {
    final c = statusColors[status]!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: AppTypography.bodySmall.copyWith(
          color: c,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _removeChip(VoidCallback onTap) {
    final c = statusColors["Remove"]!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: c.withOpacity(0.12),
        ),
        child: Text(
          "Remove",
          style: AppTypography.bodySmall.copyWith(
            color: c,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
