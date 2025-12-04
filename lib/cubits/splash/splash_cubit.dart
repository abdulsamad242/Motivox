import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // UNCOMMENTED
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
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tb3Rpdm94YXBwLmNvbS9hcGkvc2NyZWVuL29uYm9hcmRpbmctc3RlcDEiLCJpYXQiOjE3NjQ4NDQ0MDEsImV4cCI6MTc2NDg1MjI4MiwibmJmIjoxNzY0ODQ4NjgyLCJqdGkiOiJVU0x0Y29STlJteXhDejlNIiwic3ViIjoiMjMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.jtVCFuC5_2igCGXM6NRKTg78jfBKIo0jnNpNiiJZ3CQ";

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
      // This catch block executes if the API call failed AND there was no local cache fallback.
      emit(state.copyWith(isLoading: false));
      debugPrint("Splash load error: $e");
    }
  }

  // Helper to handle the processing and in-memory caching logic
  void _processAndCache(String screenName, Map<String, dynamic> decoded) {
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
  }

  Future<Map<String, dynamic>> _fetchScreen(String screenName) async {
    const cacheKey = 'onboarding_screen_';
    final storageKey = '$cacheKey$screenName';
    final url = Uri.parse("https://api.motivoxapp.com/api/screen/$screenName");
    
    // Initialize SharedPreferences instance once
    final prefs = await SharedPreferences.getInstance(); 

    try {
      // 1. ALWAYS attempt the network call on each run
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $_token",
        },
      ).timeout(const Duration(seconds: 15)); // Add a timeout for better user experience

      debugPrint(
        "[$screenName] STATUS: ${response.statusCode}\n${response.body}",
        wrapWidth: 1024,
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map<String, dynamic>;

        // 2. SUCCESS: Store the raw JSON string persistently in local storage
        await prefs.setString(storageKey, response.body); // IMPLEMENTED
        
        // 3. Process and cache in-memory for immediate use
        _processAndCache(screenName, decoded);
        return decoded;
      }

      // If status is not 200 (e.g., 401, 404, 500), throw an exception to hit the catch block
      throw Exception("API returned status ${response.statusCode}");
      
    } catch (e) {
      // 4. FAILURE/ERROR: Try to load from local storage as fallback
      debugPrint("[$screenName] API failed or timed out ($e). Attempting local cache fallback.");
      
      final cachedJson = prefs.getString(storageKey); // IMPLEMENTED
      
      if (cachedJson != null) {
        debugPrint("[$screenName] Successfully loaded from local storage.");
        
        // Parse the raw JSON string retrieved from storage
        final decoded = jsonDecode(cachedJson) as Map<String, dynamic>; 
        
        // Process and cache in-memory
        _processAndCache(screenName, decoded);
        return decoded;
      } else {
        // 5. Hard failure: No network and no local cache
        throw Exception("Failed to load $screenName. No fresh data and no local cache available.");
      }
    }
  }


  dynamic getCachedScreen(String key) {
    return _cache[key];
  }
}