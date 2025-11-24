import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // ===== TOP HEADER — CENTERED LOGO ONLY =====
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

              const SizedBox(height: 5),

              // ===== SUBSCRIPTION PLAN HEADER =====
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15),
                    ),
                    child: Icon(Icons.money, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Subscription Plan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // ===== START FOR FREE CARD =====
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/images/subscription_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Dark Gradient Overlay (for text contrast)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left: Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "START FOR FREE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Experience motivation redefined. 7 days free trial.",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Right: Progress Circle
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CircularProgressIndicator(
                                  value: 0.72,
                                  strokeWidth: 5,
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFFFF9001)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "72%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Complete",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===== MONTHLY PLAN CARD =====
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF483A74), Color(0xFF2E2849)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Lightning Icon + Tagline
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFF9001).withOpacity(0.2),
                          ),
                          child: Icon(Icons.bolt, color: const Color(0xFFFF9001), size: 18),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "STAY CONSISTENT. GROW DAILY",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Title + Price
                    Text(
                      "Monthly",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "₹299 / month",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Stay Consistent. Build Habits. Grow Daily.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Feature List
                    _featureItem(
                      icon: Icons.sunny,
                      title: "Positivity and GIVER Tracker",
                      subtitle: "Stay inspired and track how you give back daily",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.bar_chart,
                      title: "Daily Productivity Dashboard",
                      subtitle: "See your progress and stay focused on what matters",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.shield,
                      title: "Manage Your Daily Tasks & Reminders",
                      subtitle: "Stay organized and never miss what's important.",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.flag,
                      title: "Set and Manage Your Life Goals",
                      subtitle: "Define your Dreams and break them into achievable steps.",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.note,
                      title: "Write Your Daily Diary & Thoughts",
                      subtitle: "Reflect, release, and grow with mindful journaling",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.smart_toy,
                      title: "Access Your AI Buddy",
                      subtitle: "Get guidance, clarity, and answers to your career or business questions.",
                    ),
                    const SizedBox(height: 20),

                    // Start Free Trial Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9001),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      child: const Text(
                        "Start Free Trial",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===== YEARLY PLAN CARD =====
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF483A74), Color(0xFF2E2849)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header: Leaf Icon + Tagline
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFF9001).withOpacity(0.2),
                          ),
                          child: Icon(Icons.eco, color: const Color(0xFFFF9001), size: 18),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "COMMIT FOR A YEAR. TRANSFORM FOR LIFE.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Title + Price
                    Text(
                      "Yearly",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "₹2,499 / Year",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "(Save 30%)",
                      style: TextStyle(
                        color: const Color(0xFFFF9001),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Feature List
                    _featureItem(
                      icon: Icons.shield,
                      title: "Everything in monthly plan",
                      subtitle: "",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.bookmark,
                      title: "Lifetime Habit Tracker",
                      subtitle: "",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.headphones,
                      title: "Priority Support & Early Access Features",
                      subtitle: "",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.person,
                      title: "Personalized Insights & motivational Reports",
                      subtitle: "",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.group,
                      title: "FREE 1-1 Monthly Business Guidance",
                      subtitle: "",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.people,
                      title: "FREE Lifetime Community Access",
                      subtitle: "",
                    ),
                    const SizedBox(height: 8),
                    _featureItem(
                      icon: Icons.analytics,
                      title: "Monthly Progress Report",
                      subtitle: "",
                    ),
                    const SizedBox(height: 20),

                    // Go Yearly Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9001),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      child: const Text(
                        "Go Yearly & Save 30%",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(            
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
    // Set the color here
    borderRadius: BorderRadius.circular(10), // Adjust the radius (e.g., 10) for round corners
  ),
              child: Center(
                child: Text(
                  "Your Journey to success starts with a single decision",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Feature Item
  Widget _featureItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}