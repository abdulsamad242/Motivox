import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainBg = Color(0xFF0B1732);
    const cardColor = Color(0xFF212A49);

    return Scaffold(
      backgroundColor: mainBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          children: [
            const SizedBox(height: 12),
            // Custom Account Header
            Container(
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
                  // Top row: Logo, stats, icons
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
                              value: 0.6,
                              strokeWidth: 4,
                              backgroundColor: Colors.white24,
                              valueColor: AlwaysStoppedAnimation(Color(0xFFFF9001)),
                            ),
                          ),
                          const Text(
                            "60%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      // Notif icon with circular bg
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.13),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications, color: Colors.white, size: 23),
                          splashRadius: 21,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Settings icon with circular bg
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.13),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings, color: Colors.white, size: 23),
                          splashRadius: 21,
                        ),
                      ),
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
                      "Account",
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
            ),
            const SizedBox(height: 19),

            // Account options cards
            _accountOption(
              icon: Icons.person,
              label: "Update Profile",
              onTap: () {},
            ),
            const SizedBox(height: 9),
            _accountOption(
              icon: Icons.credit_card,
              label: "Subscription Plan",
              onTap: () {},
            ),
            const SizedBox(height: 9),
            _accountOption(
              icon: Icons.settings,
              label: "Settings",
              onTap: () {},
            ),
            const SizedBox(height: 9),
            _accountOption(
              icon: Icons.support_agent,
              label: "Support / Help",
              onTap: () {},
            ),
            const SizedBox(height: 9),
            _accountOption(
              icon: Icons.logout,
              label: "Logout",
              onTap: () {},
              showChevron: false, // No chevron for logout
            ),
            const SizedBox(height: 9),

            // Delete Account pill (highlighted)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.19),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.delete, color: Colors.red, size: 22),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "Delete Account",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Account menu item builder
  Widget _accountOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool showChevron = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.11),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Row(
            children: [
              // Icon with background
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.17),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 21),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.5,
                  ),
                ),
              ),
              if (showChevron)
                Icon(Icons.chevron_right, color: Colors.white38, size: 25),
            ],
          ),
        ),
      ),
    );
  }
}
