import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final goalTitleController = TextEditingController();
  final dateController = TextEditingController();
  String selectedPriority = "Medium";

  String ringtone = "Default";

  final List<Map<String, String>> goals = [
    {"title": "Making €1 DR", "status": "Pending"},
    {"title": "Ready my roof", "status": "Completed"},
    {"title": "Becoming An Author", "status": "Pending"},
    {"title": "Becoming A Leader", "status": "Completed"},
    {"title": "Learning AI Tools", "status": "Pending"},
  ];

  final Map<String, Color> statusColors = const {
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

            // -------------------------------------------------
            // HEADER TITLE + ADD BUTTON
            // -------------------------------------------------
            _glassCard(
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.13),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/icons/goals_home_page.png",
                        width: 33,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "My Life Goals",
                      style: AppTypography.sectionTitle.copyWith(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2274F0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 11,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.add, size: 18, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          "Add Goal",
                          style: AppTypography.button.copyWith(
                            fontSize: 14,
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

            // -------------------------------------------------
            // GOAL FORM GLASS CARD
            // -------------------------------------------------
            _glassCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Goal Title
                  Text("Goal Title", style: AppTypography.bodyMedium),
                  const SizedBox(height: 6),
                  _glassInput(goalTitleController, "E.g. Making 1 Cr"),

                  const SizedBox(height: 14),

                  // Date
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

                  const SizedBox(height: 16),

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

                  // Reminder Required
                  Text("Is Reminder Required?", style: AppTypography.bodyMedium),
                  const SizedBox(height: 8),
                  _reminderToggle(),

                  const SizedBox(height: 12),

                  // Ringtone
                  _ringtoneTile(),

                  const SizedBox(height: 18),

                  // Save
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9001),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // -------------------------------------------------
            // LIST TITLE
            // -------------------------------------------------
           // single glass card – title + list
_glassCard(
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //  title  moved  inside
      Text(
        "My Goals List",
        style: AppTypography.sectionTitle.copyWith(fontSize: 20),
      ),
      const SizedBox(height: 12),
      // goals
      ...List.generate(goals.length, (i) {
        return Container(
          margin: EdgeInsets.only(bottom: i == goals.length - 1 ? 0 : 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  goals[i]["title"]!,
                  style: AppTypography.bodyMedium.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              _statusChip(goals[i]["status"]!),
              const SizedBox(width: 8),
              _removeChip(() => setState(() => goals.removeAt(i))),
            ],
          ),
        );
      }),
    ],
  ),
),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }

  // ====================================================
  // GLASS CARD WRAPPER
  // ====================================================
  Widget _glassCard(Widget child) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14,18,14,18),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.13)),
      ),
      child: child,
    );
  }

  // ====================================================
  // INPUT FIELD (GLASS)
  // ====================================================
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
      style: AppTypography.bodyMedium.copyWith(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: Colors.white54, size: 18)
            : null,
        filled: true,
        fillColor: Colors.white.withOpacity(0.15),
        hintText: hint,
        hintStyle: AppTypography.hint.copyWith(color: Colors.white70),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.38)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.38)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.85),
            width: 1.3,
          ),
        ),
      ),
    );
  }

  // ====================================================
  // PRIORITY PILL
  // ====================================================
  Widget _priorityPill(String label) {
    final bool isSelected = selectedPriority == label;

    return GestureDetector(
      onTap: () => setState(() => selectedPriority = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: Colors.white.withOpacity(0.50),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8),
            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.3),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 9,
                        height: 9,
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

  // ====================================================
  // REMINDER TOGGLE
  // ====================================================
  Widget _reminderToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          Text("Yes", style: AppTypography.bodyMedium.copyWith(color: Colors.white)),
          const Spacer(),
          Radio<bool>(
            value: true,
           
            onChanged: (_) {},
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }

  // ====================================================
  // RINGTONE TILE
  // ====================================================
  Widget _ringtoneTile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          const Icon(Icons.music_note, color: Colors.white70),
          const SizedBox(width: 12),
          Text("Ringtone", style: AppTypography.bodyMedium.copyWith(color: Colors.white70)),
          const Spacer(),
          Text(ringtone, style: AppTypography.bodyMedium.copyWith(color: Colors.white)),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.white70),
        ],
      ),
    );
  }

  // ====================================================
  // STATUS CHIP
  // ====================================================
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

  // ====================================================
  // REMOVE CHIP
  // ====================================================
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
