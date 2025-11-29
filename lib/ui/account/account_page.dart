import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/app_background.dart';
import '../../theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: AppBackground(
        
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              // ==========================
//        HEADER SECTION
// ==========================
Container(
  padding: EdgeInsets.only(
    top: statusBar - 40, // 🔥 much smaller now
    left: 9,
    right: 9,
    bottom: 12, // Added small bottom padding to prevent overflow
  ),

  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 37, 49, 71),
        Color.fromARGB(255, 45, 91, 176),
        Color.fromARGB(255, 37, 49, 71),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(22),
    ),
  ),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 🔵 GLASS CONTAINER AROUND FULL ROW
      ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 20,   // 🔥 reduced height
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(22),
            ),

            child: Row(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 60,   // 🔥 slightly smaller
                ),

                const Spacer(),

                // Progress
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        value: 0.60,
                        strokeWidth: 6,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation(
                          Color(0xFFFF9001),
                        ),
                      ),
                    ),
                    Text(
                      "60%",
                      style: AppTypography.sectionTitle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 10),
                _circleIcon("assets/icons/rem.png"),
                const SizedBox(width: 10),
                _circleIcon("assets/icons/set.png"),
              ],
            ),
          ),
        ),
      ),

      SizedBox(height: 14), // ✔ controlled spacing
      
      // ---------- ACCOUNT TITLE ----------
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          "Account",
          style: AppTypography.title.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            height: 1.1,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
),


              SizedBox(height: 22),

              // ==========================
              //       MENU ITEMS
              // ==========================
              _accountOption(
                icon: "assets/icons/pro.png",
                label: "Update Profile",
                onTap: () => context.go('/update'),
              ),

              _accountOption(
                icon: "assets/icons/subs.png",
                label: "Subscription Plan",
                onTap: () => context.go('/subscription'),
              ),

              _accountOption(
                icon: "assets/icons/set.png",
                label: "Settings",
                onTap: () => context.go('/setting'),
              ),

              _accountOption(
                icon: "assets/icons/help.png",
                label: "Support / Help",
                onTap: () => context.go('/support'),
              ),

              _accountOption(
                icon: "assets/icons/log.png",
                label: "Logout",
                onTap: () => context.go('/welcome'),
                showChevron: false,
              ),


              // ==========================
              //       DELETE ACCOUNT
              // ==========================
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.20),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/del.png",
                            width: 22,
                            height: 22,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Delete Account",
                        style: AppTypography.sectionTitle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
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

  // ==========================
  //          circle icon
  // ==========================
  Widget _circleIcon(String asset) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          asset,
          width: 50,
          height: 50,
          color: Colors.white,
        ),
      ),
    );
  }

  // ==========================
  //         MENU ITEM
  // ==========================
  Widget _accountOption({
    required String icon,
    required String label,
    required VoidCallback onTap,
    bool showChevron = true,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    icon,
                    width: 21,
                    height: 21,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 15),

              Expanded(
                child: Text(
                  label,
                  style: AppTypography.sectionTitle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),

              if (showChevron)
                const Icon(Icons.chevron_right,
                    color: Colors.white38, size: 25),
            ],
          ),
        ),
      ),
    );
  }
}
