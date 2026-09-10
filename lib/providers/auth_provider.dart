import 'package:flutter/material.dart';

import '../models/login_model.dart';
import '../repos/auth_repository.dart';

class AuthProvider extends ChangeNotifier {

  final AuthRepository authRepository;

  AuthProvider({required this.authRepository});

  bool isLoading = false;
  String errorMessage = "";
  bool isLoggedIn = false;

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    errorMessage = "";
    notifyListeners();

    try {
      final LoginModel loginModel = LoginModel(
        email: email,
        password: password,
      );

      await authRepository.login(loginModel: loginModel);

      isLoggedIn = true;

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
      errorMessage = "Login failed";
      isLoggedIn = false;
      isLoading = false;
      notifyListeners();
    }
  }
}
