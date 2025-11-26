import 'package:go_router/go_router.dart';
import 'package:motivix/ui/account/profile_update_page.dart';
import 'package:motivix/ui/account/settings_page.dart';
import 'package:motivix/ui/dashbaord/dashboard.dart';
import 'package:motivix/ui/home/main_page.dart';
import 'package:motivix/ui/identity/identity_add_page.dart';
import 'package:motivix/ui/onboarding/identity_setup_page.dart';
import 'package:motivix/ui/onboarding/identity_step_four.dart';
import 'package:motivix/ui/onboarding/profile_progress_page.dart';
import 'package:motivix/ui/onboarding/purpose_step_three.dart';
import 'package:motivix/ui/onboarding/splash_page.dart';
import 'package:motivix/ui/onboarding/step_two_growth_area.dart';
import 'package:motivix/ui/onboarding/welcome_page.dart';
import 'package:motivix/ui/onboarding/why_summary_page.dart';
import 'package:motivix/ui/productivity/vision_board.dart';

enum AppRoute {
  intro,
  login,
  signup,
  home,
  profile,

  settings,
  profileProgress,
  splash,
  welcome,
  identitySetup,
  identitySteptwo,
  identityStepthree,
  identityStepfour,
  summaryPage,
  visionBoard,
  addIdentityStep,
}

class AppRoutes {
  static const String intro = '/intro';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String profileProgress = '/profile-progress';
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String identitySetup = '/identity-setup';
  static const String identitySteptwo = '/identity-steptwo';
  static const String identityStepthree = '/identity-stepthree';
  static const String identityStepfour = '/identity-stepfour';
  static const String summaryPage = '/summary-page';
  static const String visionBoard = '/vision-board';
  static const String addIdentityStep = '/add-identity-step';
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashPage()),
      GoRoute(path: welcome, builder: (context, state) => const WelcomePage()),
      GoRoute(
        path: identitySetup,
        builder: (context, state) => const IdentityStepOne(),
      ),
      GoRoute(
        path: identitySteptwo,
        builder: (context, state) => const GrowthAreaStepTwo(),
      ),
      GoRoute(
        path: addIdentityStep,
        builder: (context, state) => const AddIdentityPage(),
      ),
      GoRoute(
        path: visionBoard,
        builder: (context, state) => const VisionBoardPage(),
      ),
      GoRoute(
        path: summaryPage,
        builder: (context, state) => const WhySummaryPage(),
      ),
      GoRoute(
        path: identityStepthree,
        builder: (context, state) => const PurposeStepThree(),
      ),
      GoRoute(
        path: identityStepfour,
        builder: (context, state) => const IdentityStepFour(),
      ),

      GoRoute(path: login, builder: (context, state) => const WelcomePage()),
      GoRoute(path: signup, builder: (context, state) => const WelcomePage()),
      GoRoute(
        path: home,
        builder: (context, state) => const UserAppDashboardView(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const UpdateProfilePage(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: profileProgress,
        builder: (context, state) => const ProfileProgressPage(),
      ),
    ],
  );
}
