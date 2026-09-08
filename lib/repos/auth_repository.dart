import 'package:dio/dio.dart';

import '../core/models/user_session.dart';
import '../core/storage/secure_session_storage.dart';
import '../datasources/auth_datasource.dart';
import '../models/login_model.dart';

class AuthRepository {
  final AuthDataSource authDataSource;
  final SecureSessionStorage secureSessionStorage;
  AuthRepository({
    required this.authDataSource,
    required this.secureSessionStorage,
  });

  Future<void> login({required LoginModel loginModel}) async {
    Response response = await authDataSource.login(loginModel: loginModel);

    final String token = response.data["token"];

    await secureSessionStorage.saveSession(
      userSession: UserSession(token: token),
    );
  }
}
