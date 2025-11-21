import 'package:flutter/material.dart';

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
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            // App Logo Header
            Container(
              height: 90,
              margin: const EdgeInsets.only(bottom: 16),
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
                  "assets/images/logo.png", // Replace with your logo
                  height: 60,
                ),
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "Sleep Note",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.92),
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hours Slept
                  const Text(
                    "Hours Slept",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.5),
                  ),
                  const SizedBox(height: 7),
                  _roundedInput(
                    controller: hoursSleptController,
                    hint: "Enter your hours slept",
                  ),
                  const SizedBox(height: 14),
                  // Bed Time
                  const Text(
                    "Bed Time",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.5),
                  ),
                  const SizedBox(height: 7),
                  _roundedInput(
                    controller: bedTimeController,
                    hint: "Enter your bed time",
                  ),
                  const SizedBox(height: 14),
                  // Sleep Quality
                  const Text(
                    "Sleep Quality",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.5),
                  ),
                  const SizedBox(height: 7),
                  _sleepQualityDropdown(),
                  const SizedBox(height: 14),
                  // Wake Up
                  const Text(
                    "Wake Up",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.5),
                  ),
                  const SizedBox(height: 7),
                  _roundedInput(
                    controller: wakeUpController,
                    hint: "Enter your wake time",
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your save logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9001),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        elevation: 0,
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
          ],
        ),
      ),
    );
  }

  Widget _roundedInput({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 15.3,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        filled: true,
        fillColor: Colors.white.withOpacity(0.16), // Brighter white field
        hintText: hint,
        hintStyle: const TextStyle(
            color: Color(0xF4FFFFFF), fontWeight: FontWeight.w400, fontSize: 15.3),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.58), width: 1.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.98), width: 1.4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }

  Widget _sleepQualityDropdown() {
    return GestureDetector(
      onTap: () async {
        final int? selected = await showDialog<int>(
          context: context,
          builder: (ctx) => SimpleDialog(
            backgroundColor: const Color(0xFF2E335A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            title: const Text('Select Sleep Quality', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            children: List.generate(sleepQualityOptions.length, (i) {
              return SimpleDialogOption(
                onPressed: () => Navigator.of(ctx).pop(i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    children: [
                      Text(
                        sleepQualityOptions[i]['emoji']!,
                        style: const TextStyle(fontSize: 22),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        sleepQualityOptions[i]['label']!,
                        style: TextStyle(
                          color: i == selectedQualityIndex ? const Color.fromARGB(255, 253, 120, 49) : Colors.white,
                          fontWeight: i == selectedQualityIndex ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
        if (selected != null) setState(() => selectedQualityIndex = selected);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.11),
          border: Border.all(color: Colors.white.withOpacity(0.60), width: 1),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.11),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Row(
                children: [
                  Text(
                    sleepQualityOptions[selectedQualityIndex]['emoji']!,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 20),
                ],
              ),
            ),
            Text(
              sleepQualityOptions[selectedQualityIndex]['label']!,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.2),
            ),
          ],
        ),
      ),
    );
  }
}
