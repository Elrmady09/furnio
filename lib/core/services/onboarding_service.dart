  import 'package:shared_preferences/shared_preferences.dart';

  class OnBoardingService {
    static const _key = 'onboarding_seen';

    static Future<bool> hasSeenOnBoarding() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_key) ?? false;
    }

    static Future<void> setSeenOnBoarding() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_key, true);
    }
  }
