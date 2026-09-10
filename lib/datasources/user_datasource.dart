import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/constants/api_constants.dart';

class UserDataSource {
  final Dio dio = GetIt.instance<Dio>();

  Future<Response> getProfile({required String token}) async {
    final response = await dio.get(
      ApiConstants.profile,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return response;
  }
}