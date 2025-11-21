import 'package:flutter/material.dart';

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
    const cardColor = Color(0xFF212A49);
    const fieldOuterColor = Color(0xFF222D49);
    const borderColor = Color(0x33FFFFFF);
    const dividerColor = Color(0x1AFFFFFF);

    return Scaffold(
      backgroundColor: const Color(0xFF0B1732),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          children: [
            const SizedBox(height: 10),
            // Logo/Header
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
            // Settings Title Row
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.settings, color: Colors.white, size: 21),
                ),
                const SizedBox(width: 9),
                const Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.7,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Switches Section
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.85),
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: borderColor, width: 1.1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Column(
                children: [
                  _settingsSwitchTile(
                    icon: Icons.notifications_active_outlined,
                    label: "Reminder Sound",
                    value: reminderSound,
                    onChanged: (v) => setState(() => reminderSound = v),
                  ),
                  _settingsSwitchTile(
                    icon: Icons.nights_stay_outlined,
                    label: "Night Mode",
                    value: nightMode,
                    onChanged: (v) => setState(() => nightMode = v),
                  ),
                  _settingsSwitchTile(
                    icon: Icons.format_quote_outlined,
                    label: "Daily Quotes",
                    value: dailyQuotes,
                    onChanged: (v) => setState(() => dailyQuotes = v),
                  ),
                  _settingsSwitchTile(
                    icon: Icons.favorite_border,
                    label: "Emotion Tracker",
                    value: emotionTracker,
                    onChanged: (v) => setState(() => emotionTracker = v),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 13),

            // --- FIELDS GROUPED IN SINGLE CARD ---
            Container(
              decoration: BoxDecoration(
                color: fieldOuterColor.withOpacity(0.97),
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: borderColor, width: 1.1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              child: Column(
                children: [
                  _settingsNumberRow(
                    icon: Icons.favorite_border,
                    label: "Gratitude Lines",
                    controller: gratitudeLines,
                  ),
                  _numberRowDivider(),
                  _settingsNumberRow(
                    icon: Icons.calendar_today,
                    label: "Daily Goals Limit",
                    controller: dailyGoalsLimit,
                  ),
                  _numberRowDivider(),
                  _settingsNumberRow(
                    icon: Icons.notifications_active_outlined,
                    label: "Daily Reminders Limit",
                    controller: dailyRemindersLimit,
                  ),
                  _numberRowDivider(),
                  _settingsNumberRow(
                    icon: Icons.timer_outlined,
                    label: "Focus Duration (Min)",
                    controller: focusDuration,
                  ),
                  _numberRowDivider(),
                  _settingsNumberRow(
                    icon: Icons.timer_outlined,
                    label: "Break Duration (Min)",
                    controller: breakDuration,
                    isLast: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            // Save & Reset Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9001),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      "Save Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF192042),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Reset Defaults",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5,
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

  // --- UTILITY WIDGETS ---
  Widget _settingsSwitchTile({
    required IconData icon,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.09),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: Colors.white.withOpacity(0.85), size: 19),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.75,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFFFFA726),
              activeTrackColor: const Color(0x33FFA726),
              inactiveThumbColor: Colors.white38,
              inactiveTrackColor: Colors.white12,
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberRowDivider() => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 0,
      );

  Widget _settingsNumberRow({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 0),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.09),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon + label row
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 3),
            child: Row(
              children: [
                Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Colors.white70, size: 15),
                ),
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,

                    ),
                  ),
                ),
              ],
            ),
          ),
          // TextField with white border only
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 15),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.22),
                    width: 1.1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.22),
                    width: 1.1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.36),
                    width: 1.2,
                  ),
                ),
                isDense: true,
                hintText: '',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                filled: false, // No fill color!
              ),
            ),
          ),
        ],
      ),
    );
  }
}
