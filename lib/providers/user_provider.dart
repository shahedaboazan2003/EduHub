import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repos/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository userRepository;

  UserProvider({required this.userRepository});

  UserModel? user;
  bool isLoading = false;
  String errorMessage = '';

  // Future<void> getProfile() async {
  //   isLoading = true;
  //   errorMessage = '';
  //   notifyListeners();

  //   try {
  //     user = await userRepository.getProfile();
  //   } catch (e) {
  //     print(e);
  //     errorMessage = 'Failed to load profile';
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> getProfile() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      user = await userRepository.getProfile();

      print('USER NAME: ${user?.firstName}');
      print('USER EMAIL: ${user?.email}');
      print('USER IMAGE: ${user?.profileImage}');
    } catch (e) {
      print('PROFILE ERROR: $e');
      errorMessage = 'Failed to load profile';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
