import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Toggle states
  bool reminderSound = true;
  bool nightMode = false;
  bool dailyQuotes = true;
  bool emotionTracker = true;

  // Number fields controllers
  final gratitudeLines = TextEditingController(text: "5");
  final dailyGoalsLimit = TextEditingController(text: "3");
  final dailyRemindersLimit = TextEditingController(text: "10");
  final focusDuration = TextEditingController(text: "25");
  final breakDuration = TextEditingController(text: "5");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              const SizedBox(height: 10),
              const AppHeader(),
              const SizedBox(height: 20),

              // ----- TITLE ROW -----
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.settings,
                        size: 21, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Settings",
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 18,        // EXACT SIZE
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // ------------------ SWITCHES ------------------
              _glassCard(
                child: Column(
                  children: [
                    _settingsSwitchTile(
                      icon: "assets/icons/rem.png",
                      label: "Reminder Sound",
                      value: reminderSound,
                      onChanged: (v) => setState(() => reminderSound = v),
                    ),
                    _settingsSwitchTile(
                      icon: "assets/icons/night.png",
                      label: "Night Mode",
                      value: nightMode,
                      onChanged: (v) => setState(() => nightMode = v),
                    ),
                    _settingsSwitchTile(
                      icon: "assets/icons/quo.png",
                      label: "Daily Quotes",
                      value: dailyQuotes,
                      onChanged: (v) => setState(() => dailyQuotes = v),
                    ),
                    _settingsSwitchTile(
                      icon: "assets/icons/hea.png",
                      label: "Emotion Tracker",
                      value: emotionTracker,
                      onChanged: (v) => setState(() => emotionTracker = v),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // ------------------ NUMBER FIELDS ------------------
              _glassCard(
                child: Column(
                  children: [
                    _settingsNumberRow(
                      icon: "assets/icons/gra.png",
                      label: "Gratitude Lines",
                      controller: gratitudeLines,
                    ),
                    _settingsNumberRow(
                      icon: "assets/icons/cal.png",
                      label: "Daily Goals Limit",
                      controller: dailyGoalsLimit,
                    ),
                    _settingsNumberRow(
                      icon: "assets/icons/cale.png",
                      label: "Daily Reminders Limit",
                      controller: dailyRemindersLimit,
                    ),
                    _settingsNumberRow(
                      icon: "assets/icons/foc.png",
                      label: "Focus Duration (Min)",
                      controller: focusDuration,
                    ),
                    _settingsNumberRow(
                      icon: "assets/icons/foc.png",
                      label: "Break Duration (Min)",
                      controller: breakDuration,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ----- SAVE + RESET BUTTONS -----
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9001),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      child: Text(
                        "Save Settings",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color.fromRGBO(255, 255, 255, 0.1),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      child: Text(
                        "Reset Defaults",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      
    );
  }

  // ================ GLASS CARD ================
  Widget _glassCard({required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.06),   // slightly softer glass
      borderRadius: BorderRadius.circular(20),
    ),
    child: child,
  );
}


  // ================ SWITCH ROW ================
  Widget _settingsSwitchTile({
  required String icon,
  required String label,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 7),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.12),   // POPS MORE
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        // ICON CONTAINER (more pop)
        Container(
          width: 36,
          height: 36,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.20),   // POP MORE
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(icon, fit: BoxFit.contain),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            label,
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),

        Transform.scale(
          scale: 0.85,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFFFF8C42),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.white24,
            trackOutlineColor:
                MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ],
    ),
  );
}


  // ================ NUMBER ROW ================
  Widget _settingsNumberRow({
  required String icon,
  required String label,
  required TextEditingController controller,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.12),   // POP MORE
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.22),   // POP MORE
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: AppTypography.sectionTitle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // MINI GLASS INPUT CONTAINER
Container(
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.14),   // subtle glass for field
    borderRadius: BorderRadius.circular(12),
  ),
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

  child: TextField(
    controller: controller,
    keyboardType: TextInputType.number,

    style: AppTypography.sectionTitle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    decoration: const InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: "",
      filled: false,
      fillColor: Colors.transparent,
      isCollapsed: true,
    ),
  ),
),

      ],
    ),
  );
}

}
