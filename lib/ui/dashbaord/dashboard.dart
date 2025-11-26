import 'package:flutter/material.dart';
import 'package:motivix/ui/account/account_page.dart';
import 'package:motivix/ui/account/profile_update_page.dart';
import 'package:motivix/ui/account/subscription_page.dart';
import 'package:motivix/ui/ai%20buddy/ai_buddy_page.dart';
import 'package:motivix/ui/home/bottom_nav.dart';
import 'package:motivix/ui/home/main_page.dart';
import 'package:motivix/ui/onboarding/profile_progress_page.dart';

class UserAppDashboardView extends StatefulWidget {
  final dynamic data;
  const UserAppDashboardView({super.key, this.data});

  @override
  State<UserAppDashboardView> createState() => _UserAppDashboardViewState();
}

class _UserAppDashboardViewState extends State<UserAppDashboardView>
    with WidgetsBindingObserver {
  int _currentIndex = 0;

  final List<Widget> _childs = const [
    MyMotivationalApp(),
    AiBuddyPage(),

    ProfileProgressPage(),
    SubscriptionScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _autoNavigateFromData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  // Deep link or notification navigation
  void _autoNavigateFromData() {
    if (widget.data != null && widget.data is Map) {
      if (widget.data.containsKey("navigation")) {
        setState(() {
          _currentIndex = widget.data["navigation"] ?? 0;
        });
      }
    }
  }

  // App lifecycle tracking
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
        },
      ),
      body: IndexedStack(index: _currentIndex, children: _childs),
    );
  }
}
