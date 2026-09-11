import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_keys.dart';
import '../models/user_session.dart';

class SecureSessionStorage {
  final FlutterSecureStorage secureStorage;

  SecureSessionStorage({required this.secureStorage});

  Future<void> saveSession({required UserSession userSession}) async {
    await secureStorage.write(key: AppKeys.tokenKey, value: userSession.token);
  }

  // Future<UserSession?> getSession() async {
  //   String? token = await secureStorage.read(key: AppKeys.tokenKey);

  //   if (token != null) {
  //     return UserSession(token: token);
  //   }

  //   return null;
  // }
  Future<UserSession?> getSession() async {
    String? token = await secureStorage.read(key: AppKeys.tokenKey);

    print('TOKEN EXISTS: ${token != null}');

    if (token != null) {
      return UserSession(token: token);
    }

    return null;
  }

  Future<void> clearSession() async {
    await secureStorage.delete(key: AppKeys.tokenKey);
  }
}
