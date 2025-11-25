import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motivix/ui/account/account_page.dart';
import 'package:motivix/ui/account/profile_update_page.dart';
import 'package:motivix/ui/account/settings_page.dart';
import 'package:motivix/ui/account/subscription_page.dart';
import 'package:motivix/ui/account/support_page.dart';
import 'package:motivix/ui/ai%20buddy/ai_buddy_page.dart';
import 'package:motivix/ui/emotion/emotion_reason_page.dart';
import 'package:motivix/ui/emotion/sleep_note.dart';
import 'package:motivix/ui/giver/exercise_page.dart';
import 'package:motivix/ui/giver/giver_main_page.dart';
import 'package:motivix/ui/giver/imagination_page.dart';
import 'package:motivix/ui/giver/reading_page.dart';
import 'package:motivix/ui/giver/visualization_page.dart';
import 'package:motivix/ui/goals/dailY_goals_page.dart';
import 'package:motivix/ui/goals/goals_home_page.dart';
import 'package:motivix/ui/goals/monthly_goals_page.dart';
import 'package:motivix/ui/goals/quarterly_goals_page.dart';
import 'package:motivix/ui/goals/yearly_goals_page.dart';
import 'package:motivix/ui/goals/weekly_goals_page.dart';
import 'package:motivix/ui/gratitude/family_gratitude_page.dart';
import 'package:motivix/ui/gratitude/goals.dart';
import 'package:motivix/ui/gratitude/gratitude_home_page.dart';
import 'package:motivix/ui/gratitude/life_gratitude_page.dart';
import 'package:motivix/ui/gratitude/yesterday_gratitude_page.dart';
import 'package:motivix/ui/home/home_page.dart';
import 'package:motivix/ui/identity/identity_add_page.dart';
import 'package:motivix/ui/onboarding/profile_progress_page.dart';
import 'package:motivix/ui/onboarding/welcome_page.dart';
import 'package:motivix/ui/productivity/action_dashboard.dart';
import 'package:motivix/ui/productivity/productivity_dashboard.dart';
import 'package:motivix/ui/productivity/todo_add_page.dart';
import 'package:motivix/ui/productivity/todo_list_page.dart';
import 'package:motivix/ui/productivity/vision_board.dart';

import 'theme/app_theme.dart';
import 'ui/onboarding/splash_page.dart';
import 'ui/onboarding/identity_setup_page.dart';
import 'ui/onboarding/step_two_growth_area.dart';
import 'ui/onboarding/purpose_step_three.dart';
import 'ui/onboarding/identity_step_four.dart';
import 'ui/onboarding/why_summary_page.dart';

void main() {
  runApp(const MotivoxApp());
}

class MotivoxApp extends StatelessWidget {
  const MotivoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),  // Figma size (iPhone 14 Pro)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: const VisionBoardPage(),   // <-- START FROM SPLASH
        );
      },
    );
  }
}
