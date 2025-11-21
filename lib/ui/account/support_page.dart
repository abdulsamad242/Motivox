import 'package:flutter/material.dart';
import 'package:motivix/widgets/inputs/large_text_area.dart';
class SupportHelpPage extends StatefulWidget {
  const SupportHelpPage({super.key});

  @override
  State<SupportHelpPage> createState() => _SupportHelpPageState();
}

class _SupportHelpPageState extends State<SupportHelpPage> {
  int selectedIndex = -1;
  final categories = [
    "Feature Guidance",
    "App Issue",
    "Enhancement Required",
    "Business Guidance",
    "Something Else"
  ];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 6),
            // Title Row
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.help_outline, color: Colors.white, size: 21),
                ),
                const SizedBox(width: 9),
                const Text(
                  "Support / Help",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.7,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // Illustration (replace with your asset)
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/support_illustration.png", // Place your illustration here
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 14),
            // Subtitle
            const Center(
              child: Text(
                "How Can We Help You?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Options
            Column(
              children: List.generate(categories.length, (i) {
                final isSelected = selectedIndex == i;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 120),
                      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                      decoration: BoxDecoration(
                        color: const Color(0xFF29345B).withOpacity(0.50),
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.white54,
                          width: 1.1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.white.withOpacity(0.14) : Colors.transparent,
                              border: Border.all(
                                color: isSelected ? Colors.white : Colors.white60,
                                width: 1.2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: isSelected
                                ? Center(
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              categories[i],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            // TextField
            LargeTextArea(
  hint: "Please describe your issue or question",
  controller: controller,
  minLines: 4,
),

SizedBox(height: 15),
            // Submit Button
            SizedBox(
              width: double.infinity,
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
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
