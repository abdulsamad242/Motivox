import 'dart:ui';
import 'package:flutter/material.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';

class Suggestion {
  final String title;
  final String description;
  final String iconPath;

  Suggestion(this.title, this.description, this.iconPath);
}

class AiBuddyPage extends StatefulWidget {
  const AiBuddyPage({super.key});

  @override
  State<AiBuddyPage> createState() => _AiBuddyPageState();
}

class _AiBuddyPageState extends State<AiBuddyPage> {
  final String _buddyIconPath = 'assets/icons/aiBuddy.png';

  final String _buddyDescription =
      'Your daily companion for reflection, clarity, and growth.';

  // Replaced with your PNG icons
  final List<Suggestion> _calmDownSuggestions = [
    Suggestion(
      'Take Pause',
      'Step away from what triggered your anger, even for just 2–5 minutes.',
      'assets/icons/pause.png',
    ),
    Suggestion(
      'Deep Breathing',
      'Inhale for 4 sec, hold for 4, exhale for 6. Repeat 3–5 times.',
      'assets/icons/deep.png',
    ),
    Suggestion(
      'Move Your Body',
      'A walk or quick stretch releases physical tension.',
      'assets/icons/move.png',
    ),
    Suggestion(
      'Write It Out',
      'Put your thoughts on paper instead of holding them in your head.',
      'assets/icons/write.png',
    ),
    Suggestion(
      'Listen to Music',
      'Choose calming tracks or soft instrumentals.',
      'assets/icons/music.png',
    ),
    Suggestion(
      'Talk to Someone',
      'Share with a trusted friend instead of bottling emotions.',
      'assets/icons/talk.png',
    ),
    Suggestion(
      'Reframe the Thought',
      'Ask: “Will this matter in 1 day, 1 month, or 1 year?”',
      'assets/icons/refra.png',
    ),
    Suggestion(
      'Drink Water',
      'Hydration creates a quick mental reset.',
      'assets/icons/wat.png',
    ),
  ];

  double _aiUsageProgress = 0.85;

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 10),

            _buildMotivoxHeader(statusBar),

            const SizedBox(height: 24),

            _aiBuddyIntroCard(),

            const SizedBox(height: 20),

            _suggestionHeaderCard(),

            const SizedBox(height: 20),

            ..._calmDownSuggestions
                .map((item) => _suggestionGlassCard(item))
                .toList(),

            const SizedBox(height: 20),

            _designNote(
              'Optional in the app: Add a “Start 2-minute calming exercise” button with breathing visuals.',
            ),
            const SizedBox(height: 14),
            _designNote(
              'Do you want me to design a UI card for these suggestions with icons?',
            ),

            const SizedBox(height: 20),

            _aiChatSection(),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "What’s on your mind today? Ask me anything to grow your career or business.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ======================================================
  //                MOTIVOX PERFECT HEADER
  // ======================================================
  Widget _buildMotivoxHeader(double statusBar) {
    return Container(
      padding: EdgeInsets.only(
        top: (statusBar - 40).clamp(0.0, double.infinity),

        left: 10,
        right: 10,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 37, 49, 71),
            Color.fromARGB(255, 45, 91, 176),
            Color.fromARGB(255, 37, 49, 71),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/logo.png", height: 56),

                    const Spacer(),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            value: _aiUsageProgress,
                            strokeWidth: 6,
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation(
                              Color(0xFFFF9001),
                            ),
                          ),
                        ),
                        Text(
                          "${(_aiUsageProgress * 100).toInt()}%",
                          style: AppTypography.sectionTitle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 12),
                    _headerIcon("assets/icons/rem.png"),
                    const SizedBox(width: 12),
                    _headerIcon("assets/icons/set.png"),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              "My AI Buddy",
              style: AppTypography.title.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerIcon(String asset) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(asset, width: 24, height: 24, color: Colors.white),
      ),
    );
  }

  // ======================================================
  //                  AI BUDDY INTRO
  // ======================================================
  Widget _aiBuddyIntroCard() {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(_buddyIconPath),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            _buddyDescription,
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // ======================================================
  //              SUGGESTION HEADER TEXT
  // ======================================================
  Widget _suggestionHeaderCard() {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15),
          ),
          child: const Icon(Icons.lightbulb_outline, color: Colors.white),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            "Suggestions to Stay Calm When Feeling Angry",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // ======================================================
  //               EACH GLASSCARD SUGGESTION
  // ======================================================
  Widget _suggestionGlassCard(Suggestion s) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.17),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(s.iconPath),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.title,
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  s.description,
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.80),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================
  //                  DESIGN NOTE CARDS
  // ======================================================
  Widget _designNote(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppTypography.sectionTitle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.85),
        ),
      ),
    );
  }

  // ======================================================
  //                 AI CHAT SECTION
  // ======================================================
  Widget _aiChatSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What's on your mind today?",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Ask me anything to grow your career or business",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 125,
                height: 125,

                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    'assets/images/ai.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            "Need some ideas? Try asking:",
            style: AppTypography.sectionTitle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 12),

          _questionChip("How can I attract more clients in my niche?"),
          _questionChip("What skills should I learn to grow my career?"),
          _questionChip("How can I build my personal brand online?"),

          const SizedBox(height: 22),

          _chatInputField(),
        ],
      ),
    );
  }

  // bulb.png suggestions
  Widget _questionChip(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/bulb.png',
            width: 20,
            height: 20,
            color: Colors.white.withOpacity(0.85),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: AppTypography.sectionTitle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: AppTypography.sectionTitle.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Type your question and press enter",
                hintStyle: AppTypography.sectionTitle.copyWith(
                  color: Colors.white.withOpacity(0.65),
                  fontSize: 14,
                ),
                filled: false,
                border: InputBorder.none,
              ),
            ),
          ),

          /// 🔵 Circular icon like our usual style
          GestureDetector(
            onTap: () {
              print("Send clicked");
            },
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.13), // same as other icons
              ),
              child: Center(
                child: Image.asset(
                  "assets/icons/send.png",
                  width: 22,
                  height: 22,
                  color: Colors.white.withOpacity(0.85), // tint for consistency
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
