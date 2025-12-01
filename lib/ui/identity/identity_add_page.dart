import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_background.dart';
import '../../widgets/app_header.dart';
import '../../theme/app_typography.dart';

class AddIdentityPage extends StatefulWidget {
  const AddIdentityPage({super.key});

  @override
  State<AddIdentityPage> createState() => _AddIdentityPageState();
}

class _AddIdentityPageState extends State<AddIdentityPage> {
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
    return Scaffold(
      body: AppBackground(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const AppHeader(),

            const SizedBox(height: 10),

            // ---------- MAIN TITLE SECTION ----------
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // main icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "assets/icons/id.png",
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Your Identity",
                      style: AppTypography.sectionTitle.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: 270,
                      child: Text(
                        "A picture of who you're becoming—confident, powerful, unstoppable.",
                        style: AppTypography.caption.copyWith(
                          fontSize: 13.6,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ---------- UPLOAD PHOTO GLASSCARD ----------
            _uploadCard(),

            const SizedBox(height: 28),

            Text(
              "Who I Am Becoming",
              style: AppTypography.sectionTitle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),

            // ---------- GLASS LIST OF IDENTITIES ----------
            Column(
              children: List.generate(identities.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: i == identities.length - 1 ? 0 : 12,
                  ),
                  child: _identityGlassCard(i),
                );
              }),
            ),

            const SizedBox(height: 20),

            // ---------- Add New Identity BUTTON ----------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(34, 116, 240, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  elevation: 0,
                ),
                icon: const Icon(Icons.add, color: Colors.white),
                label: Text(
                  "Add New Identity",
                  style: AppTypography.button.copyWith(fontSize: 15.5),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---------- NEW IDENTITY INPUT FIELD ----------
            _IdentityInputField(controller: controller),

            const SizedBox(height: 24),

            // ---------- SAVE BUTTON ----------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/giverMain');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9001),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  "Save",
                  style: AppTypography.button.copyWith(
                    fontWeight: FontWeight.w700,
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

  // ============================================================
  // UPLOAD PHOTO CARD (DOTTED BORDER)
  // ============================================================
  Widget _uploadCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      padding: const EdgeInsets.all(16),
      child: CustomPaint(
        painter: _DashedBorderPainter(borderRadius: BorderRadius.circular(14)),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/icons/cam.png", width: 40, height: 40),
                const SizedBox(height: 8),
                Text(
                  "Upload your picture",
                  style: AppTypography.caption.copyWith(
                    color: Colors.white54,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // GLASS IDENTITY ITEM
  // ============================================================
  Widget _identityGlassCard(int i) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: ListTile(
        dense: true, // <─ tighter vertical size
        minLeadingWidth: 30, // <─ reduce leading gap
        leading: Image.asset(
          "assets/icons/1.${i + 1}.png",
          width: 26, // slightly smaller icon
          height: 26,
        ),
        title: Text(
          identities[i],
          style: AppTypography.bodySmall.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Image.asset(
          "assets/icons/del.png",
          width: 24, // smaller delete icon
          height: 24,
          color: Colors.white.withOpacity(0.85),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 4, // <─ was 6 → now 4
        ),
      ),
    );
  }
}

// ============================================================
// INPUT FIELD (GLASS) WITH ICON + DROPDOWN
// ============================================================
class _IdentityInputField extends StatelessWidget {
  final TextEditingController? controller;

  const _IdentityInputField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 6),
      child: Row(
        children: [
          _IconDropdown(
            onChanged: (idx) {
              /* optional */
            },
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: AppTypography.bodyMedium.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.transparent,
                filled: false,
                hintText: "Enter Your Identity",
                hintStyle: AppTypography.bodyMedium.copyWith(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DOTTED BORDER PAINTER
// ============================================================
class _DashedBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;

  _DashedBorderPainter({required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.24)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    final rrect = borderRadius.toRRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );

    const dashWidth = 7;
    const dashSpace = 4;

    final path = Path()..addRRect(rrect);

    for (ui.PathMetric metric in path.computeMetrics()) {
      double dist = 0;
      while (dist < metric.length) {
        canvas.drawPath(metric.extractPath(dist, dist + dashWidth), paint);
        dist += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

class _IconDropdown extends StatefulWidget {
  final ValueChanged<int>? onChanged;
  const _IconDropdown({this.onChanged});

  @override
  State<_IconDropdown> createState() => _IconDropdownState();
}

class _IconDropdownState extends State<_IconDropdown> {
  final LayerLink _link = LayerLink();
  OverlayEntry? _entry;
  int _selected = 0; // 1.1 default
  final List<String> _icons = List.generate(
    5,
    (i) => 'assets/icons/1.${i + 1}.png',
  );

  /* ----------  open / close  ---------- */
  void _toggle() {
    if (_entry != null) {
      _entry!.remove();
      _entry = null;
      return;
    }

    final render = context.findRenderObject()! as RenderBox;
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    final offset = render.localToGlobal(Offset.zero, ancestor: overlay);
    final topY = offset.dy;
    final entryHeight = 40.0 * _icons.length; // rough height of menu

    _entry = OverlayEntry(
      builder: (_) => Positioned(
        left: offset.dx,
        width: render.size.width,
        /*  place menu ABOVE the icon  */
        bottom: overlay.size.height - topY + 4,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1F2347),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_icons.length, (i) {
                return InkWell(
                  onTap: () {
                    setState(() => _selected = i);
                    widget.onChanged?.call(i);
                    _toggle();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.asset(_icons[i], width: 28, height: 28),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_entry!);
  }

  @override
  void dispose() {
    _entry?.remove();
    super.dispose();
  }

  /* ----------  button with icon + chevron  ---------- */
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: InkWell(
        onTap: _toggle,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(_icons[_selected], width: 22, height: 22),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white70,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
