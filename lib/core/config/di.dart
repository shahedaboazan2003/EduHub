import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../datasources/auth_datasource.dart';
import '../../datasources/course_datasource.dart';
import '../../datasources/user_datasource.dart';
import '../../repos/auth_repository.dart';
import '../../repos/course_repository.dart';
import '../../repos/user_repository.dart';
import '../constants/api_constants.dart';
import '../storage/secure_session_storage.dart';
import '../storage/app_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)));

  getIt.registerSingleton<AuthDataSource>(AuthDataSource());
  getIt.registerSingleton<UserDataSource>(UserDataSource());
  getIt.registerSingleton<CourseDataSource>(CourseDataSource());
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton<AppPreferences>(
    AppPreferences(sharedPreferences: getIt<SharedPreferences>()),
  );
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
  getIt.registerSingleton<UserRepository>(
    UserRepository(
      userDataSource: getIt<UserDataSource>(),
      secureSessionStorage: getIt<SecureSessionStorage>(),
    ),
  );
  getIt.registerSingleton<CourseRepository>(
    CourseRepository(
      courseDataSource: getIt<CourseDataSource>(),
      secureSessionStorage: getIt<SecureSessionStorage>(),
    ),
  );
}
