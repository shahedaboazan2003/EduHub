import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../datasources/auth_datasource.dart';
import '../../repos/auth_repository.dart';
import '../constants/api_constants.dart';
import '../storage/secure_session_storage.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)));

  getIt.registerSingleton<AuthDataSource>(AuthDataSource());

  getIt.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  getIt.registerSingleton<SecureSessionStorage>(
    SecureSessionStorage(secureStorage: getIt<FlutterSecureStorage>()),
  );
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(
      authDataSource: getIt<AuthDataSource>(),
      secureSessionStorage: getIt<SecureSessionStorage>(),
    ),
  );
}
