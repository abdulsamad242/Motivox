import 'package:flutter/material.dart';
import '../../theme/app_gradients.dart';
import '../../theme/app_text_style.dart';
import '../../widgets/buttons/primary_button.dart';

// ---------------------------------------------------------------
// REUSABLE COMPONENTS
// ---------------------------------------------------------------

// Top big blue logo card
class DashboardHeaderCard extends StatelessWidget {
  const DashboardHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E2C4F), Color(0xFF203865)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 42,
              ),
              Row(
                children: [
                  _headerIcon(Icons.notifications_active_outlined),
                  const SizedBox(width: 10),
                  _headerIcon(Icons.calendar_month_outlined),
                  const SizedBox(width: 10),
                  _headerIcon(Icons.settings_outlined),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),

          Text(
            "Hi, Imtiyaz 👋",
            style: AppTextStyles.heading2.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "Welcome back! Let’s stay motivated today.",
            style: AppTextStyles.label.copyWith(
              color: Colors.white.withOpacity(0.75),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.12),
      ),
      child: Icon(
        icon,
        color: Colors.white.withOpacity(0.85),
        size: 18,
      ),
    );
  }
}

// Affirmation card
class SmallWhiteBubble extends StatelessWidget {
  final String text;

  const SmallWhiteBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.chat_bubble_outline, size: 18, color: Colors.black),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body.copyWith(
                color: Colors.black87,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable dashboard block
class DashboardBlock extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const DashboardBlock({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFF2A3A5C).withOpacity(0.38),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.12),
                ),
                child: Icon(icon, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.heading2.copyWith(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            subtitle,
            style: AppTextStyles.body.copyWith(
              fontSize: 14,
              color: Colors.white.withOpacity(0.80),
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          PrimaryButton(
            label: buttonText,
            
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

// Mood tracker row
class MoodTracker extends StatelessWidget {
  const MoodTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final moods = ["😄", "😊", "😐", "😔", "😩"];
    final labels = ["Happy", "Good", "Neutral", "Low", "Stressed"];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF2A3A5C), Color(0xFF1A2440)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Emoji Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              moods.length,
              (i) => Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.10),
                  shape: BoxShape.circle,
                ),
                child: Text(moods[i], style: const TextStyle(fontSize: 22)),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Labels row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: labels
                .map((e) => Text(
                      e,
                      style: AppTextStyles.label.copyWith(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ))
                .toList(),
          ),

          const SizedBox(height: 14),

          Text(
            "Keep going, every day your productivity is improving! 💪",
            style: AppTextStyles.label.copyWith(
              fontSize: 12.5,
              color: Colors.white.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}






// ---------------------------------------------------------------
// MAIN PAGE
// ---------------------------------------------------------------
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.mainBackground,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const DashboardHeaderCard(),
                const SizedBox(height: 18),

                const SmallWhiteBubble(
                  text:
                      "✨ The only way to achieve the impossible is to believe it’s possible.",
                ),
                const SizedBox(height: 24),

                // Positioning Block
                DashboardBlock(
                  icon: Icons.location_on_outlined,
                  title: "My Positioning",
                  subtitle:
                      "This defines how you want the world to see your values, voice, and uniqueness.",
                  buttonText: "Add Your Positioning",
                  onTap: () {},
                ),
                const SizedBox(height: 20),

                DashboardBlock(
                  icon: Icons.visibility_outlined,
                  title: "My Vision to the World",
                  subtitle:
                      "A powerful statement describing how you want to impact the world.",
                  buttonText: "Add Your Vision",
                  onTap: () {},
                ),
                const SizedBox(height: 20),

                DashboardBlock(
                  icon: Icons.bolt_outlined,
                  title: "What Drives Me",
                  subtitle:
                      "Your inner motivation, the purpose behind your effort and dedication.",
                  buttonText: "Add Your Reason",
                  onTap: () {},
                ),
                const SizedBox(height: 20),

                DashboardBlock(
                  icon: Icons.check_circle_outline,
                  title: "Today's Goals",
                  subtitle:
                      "Plan what you want to achieve today and track your progress.",
                  buttonText: "Add Goals",
                  onTap: () {},
                ),
                const SizedBox(height: 20),

                DashboardBlock(
                  icon: Icons.notifications_none,
                  title: "Reminders",
                  subtitle: "Set reminders to stay consistent and productive.",
                  buttonText: "Add To-Do Task",
                  onTap: () {},
                ),
                const SizedBox(height: 20),

                DashboardBlock(
                  icon: Icons.auto_graph_outlined,
                  title: "Daily Productivity",
                  subtitle: "Track your daily productivity and improve over time.",
                  buttonText: "View Stats",
                  onTap: () {},
                ),
                const SizedBox(height: 20),

                DashboardBlock(
                  icon: Icons.dashboard_customize_outlined,
                  title: "My Vision Board",
                  subtitle:
                      "Save images, quotes, goals that inspire and motivate you.",
                  buttonText: "Add Dreams",
                  onTap: () {},
                ),
                const SizedBox(height: 26),

                const MoodTracker(),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.10),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navIcon(Icons.home_filled, true),
          _navIcon(Icons.calendar_month_outlined, false),
          _navIcon(Icons.add_circle_outline, false),
          _navIcon(Icons.chat_bubble_outline, false),
          _navIcon(Icons.person_outline, false),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, bool selected) {
    return Icon(
      icon,
      size: 28,
      color: selected
          ? const Color(0xFFFF8C42)
          : Colors.white.withOpacity(0.55),
    );
  }
}
