import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/home_page.dart';
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
import 'package:motivix/ui/giver/sleep_note_screen.dart';
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
import 'package:motivix/ui/gratitude/gratitude_journal.dart';
import 'package:motivix/ui/gratitude/life_gratitude_page.dart';
import 'package:motivix/ui/gratitude/yesterday_gratitude_page.dart';

import 'package:motivix/ui/identity/identity_add_page.dart';
import 'package:motivix/ui/onboarding/profile_progress_page.dart';
import 'package:motivix/ui/onboarding/welcome_page.dart';
import 'package:motivix/ui/productivity/action_dashboard.dart';
import 'package:motivix/ui/productivity/productivity_dashboard.dart';
import 'package:motivix/ui/productivity/todo_add_page.dart';
import 'package:motivix/ui/productivity/todo_list_page.dart';
import 'package:motivix/ui/productivity/vision_board.dart';
import 'package:motivix/ui/onboarding/v1.dart';

import 'package:motivix/ui/onboarding/splash_page.dart';
import 'package:motivix/ui/onboarding/identity_setup_page.dart';
import 'package:motivix/ui/onboarding/step_two_growth_area.dart';
import 'package:motivix/ui/onboarding/purpose_step_three.dart';
import 'package:motivix/ui/onboarding/identity_step_four.dart';
import 'package:motivix/ui/onboarding/why_summary_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/ai',
      builder: (context, state) => const AiBuddyPage(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: '/update',
      builder: (context, state) => const UpdateProfilePage(),
    ),
    GoRoute(
      path: '/setting',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/subscription',
      builder: (context, state) => const SubscriptionScreen(),
    ),
    GoRoute(
      path: '/support',
      builder: (context, state) => const SupportHelpPage(),
    ),
    GoRoute(
      path: '/reason',
      builder: (context, state) => const FeelingsScreen(),
    ),
    GoRoute(
      path: '/sleepNote',
      builder: (context, state) => const SleepNoteFormPage(),
    ),
    GoRoute(
      path: '/exercise',
      builder: (context, state) => const ExerciseScreen(),
    ),
    GoRoute(
      path: '/giverMain',
      builder: (context, state) => const GiverScreen(),
    ),
    GoRoute(
      path: '/imagination',
      builder: (context, state) => const ImaginationScreen(),
    ),
    GoRoute(
      path: '/visualization',
      builder: (context, state) => const VisualizationScreen(),
    ),
    GoRoute(
      path: '/reading',
      builder: (context, state) => const ReadingScreen(),
    ),
    GoRoute(
      path: '/sleepScreen',
      builder: (context, state) => const SleepNoteScreen(),
    ),
    GoRoute(
      path: '/daily',
      builder: (context, state) => const DailyGoalsPage(),
    ),
    GoRoute(
      path: '/weekly',
      builder: (context, state) => const WeeklyGoalsPage(),
    ),
    GoRoute(
      path: '/monthly',
      builder: (context, state) => const MonthlyGoalsPage(),
    ),
    GoRoute(
      path: '/yearly',
      builder: (context, state) => const YearlyGoalsPage(),
    ),
    GoRoute(
      path: '/quarterly',
      builder: (context, state) => const QuarterlyGoalsPage(),
    ),
    GoRoute(
      path: '/goals',
      builder: (context, state) => const GoalsPage(),
    ),
    GoRoute(
      path: '/family',
      builder: (context, state) => const FamilyGratitudePage(),
    ),
    GoRoute(
      path: '/goalsHome',
      builder: (context, state) => const GoalsScreen(),
    ),
    GoRoute(
      path: '/thank',
      builder: (context, state) => const ThankfulMomentsPage(),
    ),
    GoRoute(
      path: '/gratitude',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/gratitudeJournal',
      builder: (context, state) => const GratitudeJournal(),
    ),
    GoRoute(
      path: '/life',
      builder: (context, state) => const LifeGratitudePage(),
    ),
    GoRoute(
      path: '/yesterday',
      builder: (context, state) => const YesterdaysGratitudePage(),
    ),
    GoRoute(
      path: '/addIdentity',
      builder: (context, state) => const AddIdentityPage(),
    ),
    GoRoute(
      path: '/profileProgress',
      builder: (context, state) => const ProfileProgressPage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/action',
      builder: (context, state) => const ActionDashboard(),
    ),
    GoRoute(
      path: '/productivity',
      builder: (context, state) => const ProductivityDashboard(),
    ),
    GoRoute(
      path: '/todoAdd',
      builder: (context, state) => const ToDoListScreen(),
    ),
    GoRoute(
      path: '/todoList',
      builder: (context, state) => const TaskReminderPage(),
    ),
    GoRoute(
      path: '/vision',
      builder: (context, state) => const VisionBoardPage(),
    ),
    GoRoute(
      path: '/v1',
      builder: (context, state) => const V1Page(),
    ),
    GoRoute(
      path: '/stepone',
      builder: (context, state) => const IdentityStepOne(),
    ),
    GoRoute(
      path: '/steptwo',
      builder: (context, state) => const GrowthAreaStepTwo(),
    ),
    GoRoute(
      path: '/stepthree',
      builder: (context, state) => const PurposeStepThree(),
    ),
    GoRoute(
      path: '/stepfour',
      builder: (context, state) => const IdentityStepFour(),
    ),
    GoRoute(
      path: '/why',
      builder: (context, state) => const WhySummaryPage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/why',
      builder: (context, state) => const WhySummaryPage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
   
  ],
);
