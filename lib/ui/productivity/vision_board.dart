import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/theme/app_typography.dart';
import 'package:motivix/widgets/app_background.dart';
import 'package:motivix/widgets/app_header.dart';

const Color _glass = Color.fromRGBO(255, 255, 255, 0.12);
const Color _lightGlass = Color.fromRGBO(255, 255, 255, 0.08);
const Color _orangePrimary = Color(0xFFFF9001);
const Color _buttonBlue = Color.fromRGBO(34, 116, 240, 1);

class VisionBoardPage extends StatelessWidget {
  const VisionBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 6),

            /// ----------------------------
            /// MOTIVOX REUSABLE HEADER
            /// ----------------------------
            const AppHeader(),

            const SizedBox(height: 22),

            /// ----------------------------
            /// TOP ROW → ICON + TITLE
            /// ----------------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _circleIcon("assets/icons/power.png"),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Vision Board",
                        style: AppTypography.title.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "A Picture of who i am Becoming Confident, Powerful, and Unstoppable.",
                        style: AppTypography.sectionTitle.copyWith(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 15,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// ----------------------------
            /// GLASS CARD 1: My Identity
            /// ----------------------------
            _identityCard(),

            const SizedBox(height: 22),

            /// ----------------------------
            /// GLASS CARD 2: Dream Life
            /// ----------------------------
            _dreamLifeCard(context),

            const SizedBox(height: 32),

            /// ----------------------------
            /// FINAL BUTTON
            /// ----------------------------
            _primaryButton(
              label: "Add Your Identity",
              icon: Icons.add,
              color: _buttonBlue,
              onTap: () {
                context.push('/addIdentity');
              },
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  // TOP LEFT CIRCLE ICON
  // ---------------------------------------------------------
  Widget _circleIcon(String path) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.15),
      ),
      child: Center(child: Image.asset(path, width: 26, height: 26)),
    );
  }

  // ---------------------------------------------------------
  // GLASS CARD: IDENTITY
  // ---------------------------------------------------------
  Widget _identityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _glass,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE ROW
          Row(
            children: [
              _circleIcon("assets/icons/profile.png"),
              const SizedBox(width: 12),
              Text(
                "My Identity",
                style: AppTypography.sectionTitle.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// MAIN IMAGE WITH GRADIENT QUOTE
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/my_identity.png",
                  height: 290,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.95),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned.fill(
                bottom: 16,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "\"I am driven to succeed and\n realize my goals.\"",
                    textAlign: TextAlign.center,
                    style: AppTypography.title.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// TAG LIST
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: _tag("bulb.png", "Lifelong Learner")),
                  const SizedBox(width: 6),
                  Expanded(child: _tag("heart.png", "Caring Friend")),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _tag("jet.png", "Visionary Creator")),
                  const SizedBox(width: 6),
                  Expanded(child: _tag("target.png", "Consistent Achiever")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // TAG WIDGET
  // ---------------------------------------------------------
  Widget _tag(String icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/$icon", width: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.sectionTitle.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // GLASS CARD: DREAM LIFE
  // ---------------------------------------------------------
  Widget _dreamLifeCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _glass,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              "assets/images/happy_man.jpg",
              height: 270,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Column(
              children: [
                Text(
                  "My Dream Life",
                  style: AppTypography.sectionTitle.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "What you dream defines what you build.",
                  style: AppTypography.sectionTitle.copyWith(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _dreamCard(
                      "assets/images/startup.jpg",
                      "Build a startup that helps people grow",
                    ),
                    const SizedBox(height: 10),
                    _dreamCard(
                      "assets/images/house.jpg",
                      "Buy my dream\n house",
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    _dreamCard(
                      "assets/images/bmw.jpg",
                      "I want to own a\n BMW car",
                    ),
                    const SizedBox(height: 10),
                    _dreamCard(
                      "assets/images/travel.jpg",
                      "Travel the world \n with us",
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          /// Upload Image
          _dashedCard(
            icon: Image.asset(
              "assets/icons/cam.png", // <-- change to your actual path
              width: 20,
              height: 20,
              color: Colors.white.withOpacity(0.85),
            ),
            label: "Upload a Dream Image",
            height: 120,
          ),

          const SizedBox(height: 10),

          /// Text Input
          _dreamTextField(),

          const SizedBox(height: 18),

          /// SAVE Button
          _primaryButton(
            label: "Save",
            color: _orangePrimary,
            onTap: () {
              context.go('/home');
            },
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // DREAM CARD
  // ---------------------------------------------------------
  Widget _dreamCard(String path, String caption) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              path,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              caption,
              textAlign: TextAlign.center,
              style: AppTypography.sectionTitle.copyWith(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // DASHED BORDER BOX
  // ---------------------------------------------------------
  Widget _dashedCard({
    required Widget icon, // <-- CHANGED from IconData to Widget
    required String label,
    required double height,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomPaint(
        painter: _DashedBorderPainter(radius: 20), // supports rounded corners
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon, // <-- now this can be Image.asset
              const SizedBox(height: 8),
              Text(
                label,
                style: AppTypography.sectionTitle.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  // MULTILINE DREAM INPUT
  // ---------------------------------------------------------
  Widget _dreamTextField() {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Pencil Icon
          Image.asset(
            "assets/icons/pencil.png", // <-- change to your actual path
            width: 20,
            height: 20,
            color: Colors.white.withOpacity(0.85),
          ),
          const SizedBox(width: 10),

          // 🔹 TextField expands
          Expanded(
            child: TextField(
              maxLines: 6,
              style: AppTypography.sectionTitle.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
              cursorColor: Colors.white54,
              decoration: InputDecoration(
                hintText: "Write few lines about his/her dream.",
                fillColor: Colors.transparent,
                filled: false,
                hintStyle: AppTypography.sectionTitle.copyWith(
                  color: Colors.white54,
                  fontSize: 14, // 🔥 smaller hint size
                ),
                border: InputBorder.none,
                isCollapsed: true, // makes the text align perfectly
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // BUTTON
  // ---------------------------------------------------------
  Widget _primaryButton({
    required String label,
    required Color color,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity, // 🔥 Full width
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              MainAxisAlignment.center, // 🔥 Center the text/icon
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: AppTypography.sectionTitle.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom Painter for Dashed Border
class _DashedBorderPainter extends CustomPainter {
  final double radius;
  final double dashWidth;
  final double dashSpace;

  _DashedBorderPainter({
    this.radius = 25,
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Create a ROUND RECTANGLE PATH
    final rrect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);

    // Use PathMetrics to draw segmented dashed path
    for (final metric in path.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        final extractLength = dashWidth;

        final extractedPath = metric.extractPath(
          distance,
          distance + extractLength,
        );

        canvas.drawPath(extractedPath, paint);

        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
