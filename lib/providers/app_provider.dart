import 'package:flutter/material.dart';

import '../core/storage/app_preferences.dart';
import '../core/storage/secure_session_storage.dart';
import '../repos/auth_repository.dart';

class AppProvider extends ChangeNotifier {
  final AppPreferences appPreferences;
  final SecureSessionStorage secureSessionStorage;
  final AuthRepository authRepository;
  AppProvider({
    required this.appPreferences,
    required this.secureSessionStorage,
    required this.authRepository,
  });

  bool isLoading = false;
  bool isLoggedIn = false;
  bool showOnboarding = false;
  String errorMessage = '';

  Future<void> checkAppState() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      final bool isOnboardingCompleted = appPreferences.isOnboardingCompleted();

      if (!isOnboardingCompleted) {
        showOnboarding = true;
        isLoggedIn = false;
        return;
      }
      final userSession = await secureSessionStorage.getSession();

      if (userSession != null) {
        isLoggedIn = true;
        showOnboarding = false;
      } else {
        isLoggedIn = false;
        showOnboarding = false;
      }
    } catch (e) {
      errorMessage = 'Something went wrong';
      isLoggedIn = false;
      showOnboarding = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> completeOnboarding() async {
    await appPreferences.completeOnboarding();

    showOnboarding = false;

    notifyListeners();
  }

Future<void> logout() async {
  await authRepository.logout();

  isLoggedIn = false;

  notifyListeners();
}
}
