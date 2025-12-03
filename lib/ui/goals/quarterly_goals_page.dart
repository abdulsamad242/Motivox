import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class QuarterlyGoalsPage extends StatefulWidget {
  const QuarterlyGoalsPage({super.key});

  @override
  State<QuarterlyGoalsPage> createState() => _QuarterlyGoalsPageState();
}

class _QuarterlyGoalsPageState extends State<QuarterlyGoalsPage> {
  final List<String> quarters = [
    "QTR1",
    "QTR2",
    "QTR3",
    "QTR4",
    "QTR5",
    "QTR6",
  ];
  String selectedQuarter = "QTR3";

  final goalTitleController = TextEditingController();
  final dateController = TextEditingController();
  final ringtoneController = TextEditingController(text: "Default");

  String selectedPriority = "Medium";
  String dropDownValue = "";
  bool reminderRequired = false;

  final List<String> dropDownGoals = [
    "Suppose Making 1 CR",
    "Setup a Sales Funnel",
    "Designing a Landing Page",
    "Learning AI Tools",
  ];

  final List<Map<String, String>> quarterlyGoals = [
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
    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const AppHeader(),
            const SizedBox(height: 15),

            // =====================================================
            // TITLE CARD
            // =====================================================
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.15)),
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
                        "assets/icons/quarterly_goals.png",
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "My Quarterly Goals",
                      style: AppTypography.sectionTitle.copyWith(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(34, 116, 240, 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.add, color: Colors.white, size: 18),
                        const SizedBox(width: 5),
                        Text(
                          "Add New",
                          style: AppTypography.button.copyWith(
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
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            _glassDropdown(
              items: dropDownGoals,
              value: dropDownValue.isEmpty ? null : dropDownValue,
              hint: "Suppose Making 1 CR",
              onChanged: (v) => setState(() => dropDownValue = v ?? ""),
            ),
            const SizedBox(height: 12),
            // =====================================================
            // GLASS FORM CARD
            // =====================================================
            _glassCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),

                  Text("Goal Title", style: AppTypography.bodyMedium),
                  const SizedBox(height: 6),
                  _glassInput(goalTitleController, "Eg: Making 1 cr"),

                  const SizedBox(height: 14),

                  Text("Date & Time", style: AppTypography.bodyMedium),
                  const SizedBox(height: 6),
                  _glassInput(
                    dateController,
                    "MM/DD/YY",
                    icon: Icons.calendar_today_outlined,
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        dateController.text = DateFormat(
                          'MM/dd/yyyy',
                        ).format(picked);
                      }
                    },
                  ),

                  const SizedBox(height: 14),

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

                  Text(
                    "Is Reminder Required?",
                    style: AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  _reminderToggle(),

                  const SizedBox(height: 16),

                  _ringtoneTile(),

                  const SizedBox(height: 22),

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
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),
            Text(
              "QTRLY Goals",
              style: AppTypography.sectionTitle.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 10),
            // =====================================================
            // QUARTER SELECTOR (SAME STYLE AS DATE SLIDER)
            // =====================================================
            _gllassCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: quarters.map((q) {
                        final bool isSelected = (q == selectedQuarter);

                        return GestureDetector(
                          onTap: () => setState(() => selectedQuarter = q),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 30,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color.fromRGBO(34, 116, 240, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              q,
                              style: AppTypography.bodyMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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

            const SizedBox(height: 18),

            // =====================================================
            // QUARTERLY GOALS LIST
            // =====================================================
            _glassCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Quarterly Goals List",
                    style: AppTypography.sectionTitle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 14),

                  Column(
                    children: List.generate(quarterlyGoals.length, (i) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                quarterlyGoals[i]["title"]!,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            _statusChip(quarterlyGoals[i]["status"]!),
                            const SizedBox(width: 8),
                            _removeChip(() {
                              setState(() => quarterlyGoals.removeAt(i));
                            }),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // =====================================================================
  // COMPONENT HELPERS (SAME AS DAILYGOALS)
  // =====================================================================

  Widget _glassCard(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.14)),
      ),
      child: child,
    );
  }

  Widget _gllassCard(Widget child) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.38)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: const Color(0xFF1A2445),
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          hint: Text(
            hint,
            style: AppTypography.hint.copyWith(color: Colors.white70),
          ),
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
    Function()? onTap,
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: AppTypography.bodyMedium.copyWith(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, size: 18, color: Colors.white54)
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
          borderSide: BorderSide(color: Colors.white.withOpacity(0.38)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.85)),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          Text(
            "Yes",
            style: AppTypography.bodyMedium.copyWith(color: Colors.white),
          ),
          const Spacer(),
          Radio<bool>(
            value: true,
            groupValue: reminderRequired,
            onChanged: (v) => setState(() => reminderRequired = true),
            activeColor: const Color.fromRGBO(34, 116, 240, 1),
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
        borderRadius: BorderRadius.circular(30),
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
          const SizedBox(width: 6),
          Icon(Icons.chevron_right, color: Colors.white70, size: 22),
        ],
      ),
    );
  }

  Widget _statusChip(String status) {
    final c = statusColors[status]!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: c.withOpacity(0.15),
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
          color: c.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
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
