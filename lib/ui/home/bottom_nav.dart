import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<String> _icons = const [
    "assets/icons/h.png",
    "assets/icons/a.png",
    "assets/icons/C.png",
    "assets/icons/s.png",
    "assets/icons/P.png",
  ];

  final List<String> _routes = const [
    "/home",
    "/ai",
    "/v1",
    "/productivity",
    "/account",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          final isActive = currentIndex == index;

          return GestureDetector(
            onTap: () {
              onTap(index);               // update selected tab
              context.go(_routes[index]); // navigate to route
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? const Color(0xFF2D7AFF)
                        : Colors.black.withOpacity(0.6),
                    border: Border.all(
                      color: isActive ? Colors.white : Colors.white.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      _icons[index],
                      width: 24,
                      height: 24,
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                if (isActive)
                  Container(
                    width: 20,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
