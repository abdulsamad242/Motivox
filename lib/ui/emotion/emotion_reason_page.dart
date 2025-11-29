import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

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
    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 12),

            // App Header
            const AppHeader(),
            const SizedBox(height: 20),

            // -----------------------------
            // GLASS TITLE CARD
            // -----------------------------
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please select the reason of your emotion",
                    style: AppTypography.sectionTitle.copyWith(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // -----------------------------
                  // GLASS DROPDOWN FIELD
                  // -----------------------------
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.30),
                        width: 1.1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedReason,
                        dropdownColor: const Color(0xFF182345),
                        borderRadius: BorderRadius.circular(17),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white70,
                        ),
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        hint: Text(
  "Select a reason",
  style: AppTypography.bodySmall.copyWith(
    color: Colors.white70,
    fontSize: 16,
  ),
),

                        items: reasons.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: AppTypography.bodySmall.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (v) => setState(() => selectedReason = v),
                      ),
                    ),
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
}
