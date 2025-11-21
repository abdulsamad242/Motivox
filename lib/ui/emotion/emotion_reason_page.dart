import 'package:flutter/material.dart';

class FeelingsScreen extends StatefulWidget {
  const FeelingsScreen({super.key});
  @override
  State<FeelingsScreen> createState() => _FeelingsScreenState();
}

class _FeelingsScreenState extends State<FeelingsScreen> {
  final List<String> reasons = [
    "Work stress",
    "Relationship issues",
    "Health concerns",
    "Financial worries",
    "Just feeling off",
    "Happy about success",
    "Had a good day",
    "Other",
  ];
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    // Main dark gradient background
    return Scaffold(
      backgroundColor: const Color(0xFF0B1732),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF19254C),
              Color(0xFF09163B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            children: [
              const SizedBox(height: 18),
              // Logo header
              Container(
                height: 90,
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
                    "assets/images/logo.png", // replace with your logo path
                    height: 60,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Card with title and dropdown
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Please select the reason of your emotion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.11),
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: Colors.white.withOpacity(0.38), width: 1.1),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedReason,
                          hint: const Text(
                            "Select a reason",
                            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 16.5),
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70),
                          dropdownColor: const Color(0xFF232949),
                          style: const TextStyle(color: Colors.white, fontSize: 16.5),
                          borderRadius: BorderRadius.circular(17),
                          items: reasons
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                                  ))
                              .toList(),
                          onChanged: (v) => setState(() => selectedReason = v),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer below
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
