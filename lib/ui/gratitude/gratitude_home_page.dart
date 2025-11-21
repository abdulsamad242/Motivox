import 'package:flutter/material.dart';

class ThankfulMomentsPage extends StatelessWidget {
  const ThankfulMomentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1732),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // Logo/Header
              Container(
                height: 90,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 18),
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
                    "assets/images/logo.png", // Your logo asset
                    height: 60,
                  ),
                ),
              ),

              // Page title and subtitle
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/moments.png',
                        width: 27,
                        height: 27,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Moments I'm Thankful For",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Here are the various reasons to live and enjoy your life everyday.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.66),
                            fontSize: 13.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Yesterday's Gratitude Card WITH IMAGE CONTAINER
              GratitudeCardSection(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      // Use your image path here, e.g.:
                      'assets/icons/calender.png',
                      width: 27,
                      height: 27,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: "Yesterdays Gratitude",
                items: const [
                  "I'm thankful for a productive meeting.",
                  "I enjoyed my morning coffee peacefully.",
                  "I learned something new today.",
                  "I appreciated help from my colleague.",
                  "I had dinner with my family.",
                ],
                buttonLabel: "View All Yesterday's Gratitudes",
                onButtonTap: () {},
                gradient: const LinearGradient(
                  colors: [Color(0xFF483A74), Color(0xFF2E2849)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              const SizedBox(height: 20),

              // Family Gratitude Card WITH DEFAULT ICON
              GratitudeCardSection(
                leading:Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      // Use your image path here, e.g.:
                      'assets/icons/family.png',
                      width: 27,
                      height: 27,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: "My Family Gratitude",
                items: const [
                  "I'm grateful for my parents' support.",
                  "Thankful for laughter with my kids.",
                  "Grateful for my partner's care.",
                  "My siblings always encourage me.",
                  "Appreciate my family dinners.",
                ],
                buttonLabel: "View All Family Moments",
                onButtonTap: () {},
                gradient: const LinearGradient(
                  colors: [Color(0xFF483A74), Color(0xFF2E2849)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              const SizedBox(height: 20),

              // Life Gratitude Card WITH DEFAULT ICON
              GratitudeCardSection(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      // Use your image path here, e.g.:
                      'assets/icons/life_gratitude.png',
                      width: 27,
                      height: 27,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: "My Life Gratitude",
                items: const [
                  "I'm grateful for good health.",
                  "I'm thankful for my job opportunities.",
                  "I'm proud of my progress.",
                  "I cherish time with loved ones.",
                  "I'm grateful for every new day.",
                ],
                buttonLabel: "Explore Life Gratitude",
                onButtonTap: () {},
                gradient: const LinearGradient(
                  colors: [Color(0xFF483A74), Color(0xFF2E2849)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for consistent icon containers
  static Widget _iconContainer(IconData icon) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 21),
      );
}

class GratitudeCardSection extends StatelessWidget {
  final Widget leading;
  final String title;
  final List<String> items;
  final String buttonLabel;
  final VoidCallback onButtonTap;
  final LinearGradient gradient;

  const GratitudeCardSection({
    super.key,
    required this.leading,
    required this.title,
    required this.items,
    required this.buttonLabel,
    required this.onButtonTap,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon (or Image) and Title
          Row(
            children: [
              leading,
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Gratitude Items
          ...items.map((item) => GratitudeItem(text: item)).toList(),
          const SizedBox(height: 13),
          // Action Button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: onButtonTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF8C42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                elevation: 0,
                padding: EdgeInsets.zero,
              ),
              child: Text(
                buttonLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GratitudeItem extends StatelessWidget {
  final String text;
  const GratitudeItem({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13.7,
            fontWeight: FontWeight.w400,
            height: 1.44,
          ),
        ),
      ),
    );
  }
}
