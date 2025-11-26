import 'package:flutter/material.dart';

class GrowthActionsWidget extends StatelessWidget {
  const GrowthActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F1936), // deep navy base
            Color(0xFF1B274B), // smooth mid tone (important)
            Color(0xFFFF9D5C), // orange corner
          ],
          stops: [
            0.0, // full navy start
            0.55, // soft mid-blend (not too harsh)
            1.0, // orange only at the far edge
          ],
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TODAY'S GROWTH ACTIONS",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Goals give direction. Reminders keep you consistent\nSet your goals. Take action. Stay reminded.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/growth_image.png', // Replace with your image path
              height: 180.0,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
