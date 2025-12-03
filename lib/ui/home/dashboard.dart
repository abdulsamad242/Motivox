import 'package:flutter/material.dart';
import 'package:motivix/ui/account/account_page.dart';
import 'package:motivix/ui/account/profile_update_page.dart';
import 'package:motivix/ui/ai%20buddy/ai_buddy_page.dart';
import 'package:motivix/ui/goals/dailY_goals_page.dart';
import 'package:motivix/ui/home/bottom_nav.dart';
import 'package:motivix/ui/home/home_page.dart';
import 'package:motivix/ui/onboarding/profile_progress_page.dart';
import 'package:motivix/ui/productivity/action_dashboard.dart';

class UserAppDashboardView extends StatefulWidget {
  final int? navigationIndex;

  const UserAppDashboardView({super.key, this.navigationIndex});

  @override
  State<UserAppDashboardView> createState() => _UserAppDashboardViewState();
}

class _UserAppDashboardViewState extends State<UserAppDashboardView>
    with WidgetsBindingObserver {
  late int _currentIndex;

  final List<Widget> _pages = const [
    HomePage(),
    AiBuddyPage(),
    ActionDashboard(),
    ProfileProgressPage(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _currentIndex = widget.navigationIndex ?? 0;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
    );
  }
}
