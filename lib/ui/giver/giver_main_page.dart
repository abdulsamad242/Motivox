import 'package:flutter/material.dart';

class GiverScreen extends StatelessWidget {
  const GiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          children: [
            const SizedBox(height: 12),

            // Header Section
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                gradient: const LinearGradient(
                  colors: [Color(0xFF3E5398), Color(0xFF223366)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: Logo, stats, icons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      // Circular percent indicator
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 44,
                            height: 44,
                            child: CircularProgressIndicator(
                              value: 0.6,
                              strokeWidth: 4,
                              backgroundColor: Colors.white24,
                              valueColor: AlwaysStoppedAnimation(Color(0xFFFF9001)),
                            ),
                          ),
                          const Text(
                            "60%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      _iconContainer(Icons.notifications),
                      const SizedBox(width: 8),
                      _iconContainer(Icons.settings),
                    ],
                  ),
                  const SizedBox(height: 13),
                  // GIVER label
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.11),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 14),
                    child: const Text(
                      "GIVER",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 19),

            // G - Gratitude
            _giverCard(
              image: 'assets/icons/giver_gratitude.png', // <-- Use your custom image!
              title: "G – Gratitude",
              description: "Start your day with thankfulness and focus on what’s good. It lifts your mood, calms your mind, and fills your heart with positive energy.",
              onTap: () {},
            ),

            // I - Imagination
            _giverCard(
              image: 'assets/icons/giver_imagination.png',
              title: "I – Imagination",
              description: "Dream beyond limits — imagination fuels creativity, unlocks new ideas, and helps you see endless possibilities ahead.",
              onTap: () {},
            ),

            // V - Visualization
            _giverCard(
              image: 'assets/icons/giver_visualization.png',
              title: "V – Visualization",
              description: "See your goals as already achieved in your mind. Believe it, your actions start creating it.",
              onTap: () {},
            ),

            // E - Exercise
            _giverCard(
              image: 'assets/icons/giver_exercise.png',
              title: "E – Exercise",
              description: "Move your body to power your mind — a few minutes of activity can renew your energy, boost, and motivation.",
              onTap: () {},
            ),

            // R - Reading
            _giverCard(
              image: 'assets/icons/giver_reading.png',
              title: "R – Reading",
              description: "Feed your mind with ideas and inspiration — every new page expands your thoughts and fuels your growth.",
              onTap: () {},
            ),

            // Sleep Note
            _giverCard(
              image: 'assets/icons/giver_sleep.png',
              title: "Sleep Note",
              description: "The best way to close your day is gratitude in your mind and peace in your heart. Write your Sleep Note to reflect, release, and rest peacefully.",
              onTap: () {},
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Card Builder
  Widget _giverCard({
    required String image,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.19),
        borderRadius: BorderRadius.circular(17),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(17),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom image
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.13),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 13),
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 13.2,
                        fontWeight: FontWeight.w400,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(Icons.chevron_right, color: Colors.white54, size: 27),
            ],
          ),
        ),
      ),
    );
  }

  // Header icons with background
  Widget _iconContainer(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 23),
    );
  }
}
