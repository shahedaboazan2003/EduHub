import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_keys.dart';

class SecureSessionStorage {
  final FlutterSecureStorage secureStorage;

  SecureSessionStorage({required this.secureStorage});

  Future<void> saveToken({required String token}) async {
    await secureStorage.write(key: AppKeys.accessTokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: AppKeys.accessTokenKey);
  }

  Future<void> clearSession() async {
    await secureStorage.delete(key: AppKeys.accessTokenKey);
  }
}
