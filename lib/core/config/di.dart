import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../datasources/auth_datasource.dart';
import '../../repos/auth_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:8000",
      ),
    ),
  );

  getIt.registerSingleton<AuthDataSource>(
    AuthDataSource(),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepository(
      authRemoteDataSource: getIt<AuthDataSource>(),
    ),
  );
}