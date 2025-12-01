import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  final List<String> _icons = const [
    "assets/icons/h.png",
    "assets/icons/a.png",
    "assets/icons/C.png",
    "assets/icons/s.png",
    "assets/icons/P.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          final isActive = currentIndex == index;

          return GestureDetector(
            onTap: () {
              onTap(index); // update selected tab
              // navigate to route
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
                        : Color.fromARGB(255, 25, 25, 25),
                  ),
                  child: Center(
                    child: Image.asset(
                      _icons[index],
                      width: 24,
                      height: 24,

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
