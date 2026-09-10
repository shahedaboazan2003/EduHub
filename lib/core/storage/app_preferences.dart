import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_keys.dart';

class AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferences({required this.sharedPreferences});

  Future<void> completeOnboarding() async {
    await sharedPreferences.setBool(AppKeys.isFirstTimeKey, true);
  }

  bool isOnboardingCompleted() {
    return sharedPreferences.getBool(AppKeys.isFirstTimeKey) ?? false;
  }

//   Future<void> resetOnboarding() async {
//   await sharedPreferences.remove(AppKeys.isFirstTimeKey);
// }
}
