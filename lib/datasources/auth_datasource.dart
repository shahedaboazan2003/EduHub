import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/constants/api_constants.dart';
import '../models/login_model.dart';

class AuthDataSource {
  final Dio dio = GetIt.instance<Dio>();

  Future<Response> login({required LoginModel loginModel}) async {
    final response = await dio.post(
      ApiConstants.login,
      data: loginModel.toMap(),
    );

    return response;
  }

  Future<Response> logout({required String token}) async {
  final response = await dio.post(
    ApiConstants.logout,
    options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ),
  );

  return response;
}
}
