import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/constants/api_constants.dart';

class CourseDataSource {
  final Dio dio = GetIt.instance<Dio>();

  Future<Response> getCourses({required String token}) async {
    final response = await dio.get(
      ApiConstants.courses,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    print('COURSES RESPONSE: ${response.data}');

    return response;
  }
}
