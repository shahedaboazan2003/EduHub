import 'package:dio/dio.dart';

import '../datasources/auth_datasource.dart';
import '../models/login_model.dart';

class AuthRepository {
  final AuthDataSource authRemoteDataSource;

  AuthRepository({
    required this.authRemoteDataSource,
  });

  Future<Response> login({
    required LoginModel loginModel,
  }) async {
    return await authRemoteDataSource.login(
      loginModel: loginModel,
    );
  }
}