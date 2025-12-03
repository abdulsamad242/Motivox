import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:motivix/common/models/onboarding_step_one.dart';

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
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tb3Rpdm94YXBwLmNvbS9hcGkvc2NyZWVuL29uYm9hcmRpbmctc3RlcDEiLCJpYXQiOjE3NjQ3NjE1NDIsImV4cCI6MTc2NDc2ODc2NiwibmJmIjoxNzY0NzY1MTY2LCJqdGkiOiJucWZlYVZTUjMwMUlBVnpVIiwic3ViIjoiMjQiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2oto9X5QyfDFarRdgU_S1q-2JICdYA7S9TLxbSsWdNw";

  final Map<String, dynamic> _cache = {};

  Future<void> loadInitialScreens() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _fetchScreen("onboarding-step1");
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      rethrow;
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
      "Response of screen $screenName:\n${const JsonEncoder.withIndent('  ').convert(jsonDecode(response.body))}",
      wrapWidth: 1024,
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      if (screenName == "onboarding-step1") {
        _cache["onboarding-step1"] = OnboardingScreenOne.fromJson(decoded);
      }

      return decoded;
    } else {
      throw Exception("Failed to load $screenName");
    }
  }

  dynamic getCachedScreen(String key) {
    return _cache[key];
  }
}
