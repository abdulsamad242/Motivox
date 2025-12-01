import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';
import 'package:go_router/go_router.dart';
class SleepNoteFormPage extends StatefulWidget {
  const SleepNoteFormPage({super.key});
  @override
  State<SleepNoteFormPage> createState() => _SleepNoteFormPageState();
}

class _SleepNoteFormPageState extends State<SleepNoteFormPage> {
  final hoursSleptController = TextEditingController();
  final bedTimeController = TextEditingController();
  final wakeUpController = TextEditingController();

  final List<Map<String, String>> sleepQualityOptions = [
    {"emoji": "😊", "label": "Good"},
    {"emoji": "😐", "label": "Average"},
    {"emoji": "😴", "label": "Sleepy"},
    {"emoji": "😟", "label": "Poor"},
  ];

  int selectedQualityIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const AppHeader(),
            const SizedBox(height: 20),

            // Title
            Text(
              "Sleep Note",
              style: AppTypography.sectionTitle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),

            // ===========================
            // GLASSCARD FORM
            // ===========================
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Hours Slept"),
                  const SizedBox(height: 7),
                  _glassInput(
                    controller: hoursSleptController,
                    hint: "Enter your hours slept",
                  ),

                  const SizedBox(height: 16),
                  _label("Bed Time"),
                  const SizedBox(height: 7),
                  _glassInput(
                    controller: bedTimeController,
                    hint: "Enter your bed time",
                  ),

                  const SizedBox(height: 16),
                  _label("Sleep Quality"),
                  const SizedBox(height: 7),
                  _sleepQualityDropdown(),

                  const SizedBox(height: 16),
                  _label("Wake Up"),
                  const SizedBox(height: 7),
                  _glassInput(
                    controller: wakeUpController,
                    hint: "Enter your wake time",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // ===========================
            // SAVE BUTTON OUTSIDE CARD
            // ===========================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/sleepScreen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9001),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Text(
                  "Save",
                  style: AppTypography.button.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
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

  // =========================================================
  // LABEL STYLE USING APPTYPOGRAPHY
  // =========================================================
  Widget _label(String text) {
    return Text(
      text,
      style: AppTypography.bodySmall.copyWith(
        fontSize: 14.5,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // =========================================================
  // GLASS TEXT FIELD INPUT
  // =========================================================
  Widget _glassInput({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      style: AppTypography.bodySmall.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 18),
        filled: true,
        fillColor: Colors.white.withOpacity(0.14),
        hintText: hint,
        hintStyle: AppTypography.hint1.copyWith(
          fontSize: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.50),
            width: 1.1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.90),
            width: 1.4,
          ),
        ),
      ),
    );
  }

  // =========================================================
  // CUSTOM SLEEP QUALITY DROPDOWN (Glass style)
  // =========================================================
  Widget _sleepQualityDropdown() {
    return GestureDetector(
      onTap: () async {
        final int? selected = await showDialog<int>(
          context: context,
          builder: (ctx) => SimpleDialog(
            backgroundColor: const Color(0xFF1F2347),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text(
              'Select Sleep Quality',
              style: AppTypography.sectionTitle,
            ),
            children: List.generate(sleepQualityOptions.length, (i) {
              final option = sleepQualityOptions[i];
              final isSelected = selectedQualityIndex == i;

              return SimpleDialogOption(
                onPressed: () => Navigator.of(ctx).pop(i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Text(option['emoji']!, style: const TextStyle(fontSize: 22)),
                      const SizedBox(width: 14),
                      Text(
                        option['label']!,
                        style: AppTypography.bodySmall.copyWith(
                          fontSize: 16.5,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400,
                          color:
                              isSelected ? const Color(0xFFFF9001) : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );

        if (selected != null) {
          setState(() => selectedQualityIndex = selected);
        }
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.14),
          border: Border.all(
            color: Colors.white.withOpacity(0.55),
            width: 1.1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            // Emoji Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.14),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    sleepQualityOptions[selectedQualityIndex]['emoji']!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.white70),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Label
            Text(
              sleepQualityOptions[selectedQualityIndex]['label']!,
              style: AppTypography.bodySmall.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
