import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:motivix/routes/app_routes.dart';
import 'package:motivix/theme/app_colors.dart';

class AddIdentityPage extends StatefulWidget {
  const AddIdentityPage({super.key});
  @override
  State<AddIdentityPage> createState() => _AddIdentityPageState();
}

class _AddIdentityPageState extends State<AddIdentityPage> {
  // Sample identity list
  final List<String> identities = [
    "I am a Great Character",
    "I am a Great Leader",
    "I am a Great Author",
    "I am a Great Speaker",
    "I am a Great Entrepreneur",
  ];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          children: [
            const SizedBox(height: 10),
            // Logo/Header
            Container(
              height: 90,
              margin: const EdgeInsets.only(bottom: 13),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF374E8C), Color(0xFF223365)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset("assets/images/logo.png", height: 60),
              ),
            ),
            const SizedBox(height: 5),

            // Title
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white.withOpacity(0.24),
                  size: 26,
                ),
                const SizedBox(width: 9),
                const Text(
                  "Add Your Identity",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Padding(
              padding: EdgeInsets.only(left: 34.0),
              child: Text(
                "A Picture of who I am Becoming Confident, Powerful, and unstoppable.",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 13.8,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 17),

            // Outer Card Container for Upload Section
            Container(
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.88),
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.all(18),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: CustomPaint(
                  painter: _DashedBorderPainter(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white54,
                            size: 32,
                          ),
                          const SizedBox(height: 7),
                          Text(
                            "uploads his/her picture",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.38),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Who I Am Becoming",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 11),

            // List of Identities
            // List of Identities WITHOUT main container
            Column(
              children: List.generate(identities.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: i == 0 ? 0 : 10,
                    bottom: 0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: _identityIcon(i),
                      title: Text(
                        identities[i],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      trailing: Icon(
                        Icons.delete_outline,
                        color: Colors.white.withOpacity(0.62),
                        size: 24,
                      ),
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 0,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 17),

            // Add New Identity Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 0,
                ),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "Add New identity",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Enter New Identity Field
            _IdentityInputField(controller: controller),

            const SizedBox(height: 17),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go(AppRoutes.home);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9001),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Icons for identities
  Widget _identityIcon(int i) {
    switch (i) {
      case 0:
        return const Icon(
          Icons.emoji_emotions_outlined,
          color: Colors.white,
          size: 22,
        );
      case 1:
        return const Icon(
          Icons.emoji_events_outlined,
          color: Colors.white,
          size: 22,
        );
      case 2:
        return const Icon(
          Icons.menu_book_outlined,
          color: Colors.white,
          size: 22,
        );
      case 3:
        return const Icon(
          Icons.record_voice_over_outlined,
          color: Colors.white,
          size: 22,
        );
      case 4:
        return const Icon(
          Icons.workspace_premium_outlined,
          color: Colors.white,
          size: 22,
        );
      default:
        return const Icon(Icons.person_outline, color: Colors.white, size: 22);
    }
  }
}

// Dashed border painter for upload area
class _DashedBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;
  _DashedBorderPainter({required this.borderRadius});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.21)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    final RRect rRect = borderRadius.toRRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    final Path path = Path()..addRRect(rRect);

    const dashWidth = 7.0;
    const dashSpace = 4.0;

    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double next = distance + dashWidth;
        canvas.drawPath(
          pathMetric.extractPath(distance, next.clamp(0, pathMetric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// This widget matches your provided field design.
class _IdentityInputField extends StatelessWidget {
  final TextEditingController? controller;
  const _IdentityInputField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.21), width: 1),
        // No color here!
      ),
      child: Row(
        children: [
          // Icon pill (background only here)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.09),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white.withOpacity(0.34),
                  size: 22,
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white.withOpacity(0.36),
                  size: 18,
                ),
              ],
            ),
          ),
          // TextField with **NO** background/fill!
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.2,
                fontWeight: FontWeight.w500,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Your Identity",
                hintStyle: TextStyle(color: Colors.white54, fontSize: 15),
                isDense: true,
                filled: false, // <- make sure this is false!
                contentPadding: EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
