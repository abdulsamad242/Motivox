import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:motivix/common/models/onboarding_step_four.dart' show OnboardingScreenFour;
import 'package:motivix/common/models/onboarding_step_one.dart';
import 'package:motivix/common/models/onboarding_step_three.dart' show OnboardingScreenThree;
import 'package:motivix/common/models/onboarding_step_two.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startAnimation() {
    emit(state.copyWith(startAnimation: true));
  }

  void triggerNavigation() {
    emit(state.copyWith(navigateNext: true));
    Timer(
      const Duration(milliseconds: 300),
      () => emit(state.copyWith(navigateNext: false)),
    );
  }

  static const String _token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tb3Rpdm94YXBwLmNvbS9hcGkvbG9naW4iLCJpYXQiOjE3NjQ4NDQ0MDEsImV4cCI6MTc2NDg0ODAwMSwibmJmIjoxNzY0ODQ0NDAxLCJqdGkiOiJTRzdpUjJITE84SlRWbkIyIiwic3ViIjoiMjMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.aIwjJxgxtRB82-eK_oIctWcaOviS4lfjCjO8ke3Qx0M";

  final Map<String, dynamic> _cache = {};

  Future<void> loadInitialScreens() async {
  emit(state.copyWith(isLoading: true));

  try {
    await _fetchScreen("onboarding-step1");
    await _fetchScreen("onboarding-step2");
    await _fetchScreen("onboarding-step3");
    await _fetchScreen("onboarding-step4");

    emit(state.copyWith(isLoading: false));
  } catch (e) {
    emit(state.copyWith(isLoading: false));
    debugPrint("Splash load error: $e");
  }
}


  Future<Map<String, dynamic>> _fetchScreen(String screenName) async {
  final url = Uri.parse("https://api.motivoxapp.com/api/screen/$screenName");

  final response = await http.get(
    url,
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $_token",
    },
  );

  debugPrint(
    "[$screenName] STATUS: ${response.statusCode}\n${response.body}",
    wrapWidth: 1024,
  );

  if (response.statusCode != 200) {
    throw Exception("Failed to load $screenName");
  }

  final decoded = jsonDecode(response.body);

  switch (screenName) {
    case "onboarding-step1":
      _cache[screenName] = OnboardingScreenOne.fromJson(decoded);
      break;

    case "onboarding-step2":
      _cache[screenName] = OnboardingScreenTwo.fromJson(decoded);
      break;

    case "onboarding-step3":
      _cache[screenName] = OnboardingScreenThree.fromJson(decoded);
      break;

    case "onboarding-step4":
      _cache[screenName] = OnboardingScreenFour.fromJson(decoded);
      break;

    default:
      _cache[screenName] = decoded;
  }

  return decoded;
}


  dynamic getCachedScreen(String key) {
    return _cache[key];
  }
}
