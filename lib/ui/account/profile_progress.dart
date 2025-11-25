import 'package:flutter/material.dart';

const Color _mainBg = Color(0xFF0B1732);
const Color _cardColor = Color(0xFF212A49);
const Color _orangePrimary = Color(0xFFFF9001);

class ProfileProgressPage extends StatelessWidget {
  const ProfileProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _mainBg,
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
            // Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Profile Progress",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Complete your profile to unlock full visibility and features.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Circular Progress Indicator
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background Circle (Gray)
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  // Progress Ring (Orange)
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: CircularProgressIndicator(
                      value: 0.6, // 60%
                      strokeWidth: 12,
                      valueColor: AlwaysStoppedAnimation<Color>(_orangePrimary),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  // Center Text
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "60%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Completed",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Action Button (Optional: Add “Complete Profile”)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to complete profile screen or trigger edit flow
                },
                child: Text(
                  "Complete Your Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _orangePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}