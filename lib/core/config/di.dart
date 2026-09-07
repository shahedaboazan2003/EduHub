import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/app_preferences.dart';
import '../storage/secure_session_storage.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(sharedPreferences);

  getIt.registerSingleton(FlutterSecureStorage());

  getIt.registerSingleton(
    AppPreferences(sharedPreferences: getIt()),
  );

  getIt.registerSingleton(
    SecureSessionStorage(secureStorage: getIt()),
  );

  getIt.registerSingleton(
    AuthRemoteDataSourceImpl(),
  );

  getIt.registerSingleton(
    AuthRepositoryImpl(
      remoteDataSource: getIt(),
      secureSessionStorage: getIt(),
      appPrefrences: getIt(),
    ),
  );
}