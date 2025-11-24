import 'package:flutter/material.dart';

// Defined colors for reusability
const Color _mainBg = Color(0xFF0B1732);
const Color _cardColor = Color(0xFF212A49);
const Color _orangePrimary = Color(0xFFFF9001);

class Suggestion {
  final String title;
  final String description;
  final IconData icon;

  Suggestion(this.title, this.description, this.icon);
}

class AiBuddyPage extends StatefulWidget {
  const AiBuddyPage({super.key});

  @override
  State<AiBuddyPage> createState() => _AiBuddyPageState();
}

class _AiBuddyPageState extends State<AiBuddyPage> {
  // Mock data for the AI Buddy intro card
  final String _buddyIconPath = 'assets/icons/aiBuddy.png';
  final String _buddyDescription = 'Your daily companion for reflection, clarity, and growth.';

  // Placeholder for chat messages (will be used later)
  final List<String> _messages = [];

  final List<Suggestion> _calmDownSuggestions = [
    Suggestion(
      'Take Pause',
      'Step away from what triggered your anger, even for just 2-5 minutes.',
      Icons.pause_circle_outline,
    ),
    Suggestion(
      'Deep Breathing',
      'Inhale deeply through your nose for 4 seconds, hold for 4 seconds, exhale through your mouth for 6 seconds. Repeat 3-5 times.',
      Icons.sync_alt,
    ),
    Suggestion(
      'Move Your Body',
      'A short walk, stretching, or even shaking your arms helps release tension.',
      Icons.directions_run,
    ),
    Suggestion(
      'Write It Out',
      'Put your thoughts on paper (or in the app) instead of holding them in your head.',
      Icons.menu_book,
    ),
    Suggestion(
      'Listen to Music',
      'Choose calming or instrumental tracks to shift your mood.',
      Icons.headset,
    ),
    Suggestion(
      'Talk to Someone',
      'Share how you feel with a trusted friend or colleague instead of bottling it up.',
      Icons.forum,
    ),
    Suggestion(
      'Reframe the Thought',
      'Ask: "Will this matter in 1 day, 1 month, or 1 year?"',
      Icons.psychology_alt,
    ),
    Suggestion(
      'Drink Water',
      'A simple reset—hydration helps the body relax.',
      Icons.local_drink,
    ),
  ];

  // Placeholder for progress
  double _aiUsageProgress = 0.85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _mainBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          children: [
            const SizedBox(height: 12),
            // Custom Account Header
            _buildCustomHeader(),
            const SizedBox(height: 24),
            // AI Buddy Introduction Card
            _buildAiBuddyIntroCard(),
            const SizedBox(height: 19),
            _suggestionsCard(),
            const SizedBox(height: 19),
            ..._calmDownSuggestions.map((suggestion) => _buildSuggestionItem(suggestion)).toList(),
            const SizedBox(height: 8),
            // ➕ FIRST DESIGN NOTE CONTAINER
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E2A45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Optional in the app: After showing these tips, you could add a “Would you like to do a 2-minute calming exercise now?” button that plays breathing visuals or soothing sounds.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 13),
            // ➕ SECOND DESIGN NOTE CONTAINER
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E2A45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Do you want me to design a mockup card with these calming suggestions (with icons) so you can plug it directly after someone selects “Angry”?',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 19),
            // ➕ NEW AI CHAT SECTION
            _buildAiChatSection(),
          ],
        ),
      ),
    );
  }

  // Helper function to build the header
  Widget _buildCustomHeader() {
    return Container(
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
          // Top row: Logo, progress, icons
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
                    width: 45,
                    height: 45,
                    child: CircularProgressIndicator(
                      value: _aiUsageProgress,
                      strokeWidth: 4,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation(_orangePrimary),
                    ),
                  ),
                  Text(
                    "${(_aiUsageProgress * 100).toInt()}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              // Notif icon
              _buildCircularIconButton(Icons.notifications, () {}),
              const SizedBox(width: 10),
              // Settings icon
              _buildCircularIconButton(Icons.settings, () {}),
            ],
          ),
          const SizedBox(height: 12),
          // Account label
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.11),
              borderRadius: BorderRadius.circular(13),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
            child: const Text(
              "My AI Buddy",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for circular icon buttons
  Widget _buildCircularIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 23),
        splashRadius: 21,
      ),
    );
  }

  // AI Buddy Introduction Card
  Widget _buildAiBuddyIntroCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              _buddyIconPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                _buddyDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Suggestions header card
  Widget _suggestionsCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.lightbulb_outline, color: Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                "Suggestions to Stay Calm When Feeling Angry",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Individual suggestion item
  Widget _buildSuggestionItem(Suggestion suggestion) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
              child: Icon(
                suggestion.icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suggestion.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    suggestion.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 13,
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

  // 🔹 NEW: AI Chat Section
  Widget _buildAiChatSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Text + Avatar
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What's on your mind today?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Ask me anything to grow your career or business",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // AI Avatar
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/images/ai.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Suggested Questions Header
          Text(
            "Need some ideas? Try asking questions like:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          // Suggested Question Buttons
          ...[
            "How can I attract more clients in my niche?",
            "What skills should I learn to grow my career?",
            "How can I build my personal brand online?",
          ].map((question) => _buildSuggestionButton(question)).toList(),
          const SizedBox(height: 24),
          // Input Field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your question and press enter",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: Handle message send
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Message sent!")),
                    );
                  },
                  icon: Icon(Icons.send, color: Colors.white.withOpacity(0.8)),
                  splashRadius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Helper: Suggestion Button
  Widget _buildSuggestionButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lightbulb_outline, size: 18, color: Colors.white.withOpacity(0.7)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}