import '../core/storage/secure_session_storage.dart';
import '../datasources/course_datasource.dart';
import '../models/course_model.dart';

class CourseRepository {
  final CourseDataSource courseDataSource;
  final SecureSessionStorage secureSessionStorage;

  CourseRepository({
    required this.courseDataSource,
    required this.secureSessionStorage,
  });

  Future<List<CourseModel>> getCourses() async {
    final userSession = await secureSessionStorage.getSession();

    if (userSession == null) {
      throw Exception('User is not logged in');
    }

    final response = await courseDataSource.getCourses(
      token: userSession.token,
    );

    final List data = response.data['data'];

    return data
        .map((course) => CourseModel.fromMap(course as Map<String, dynamic>))
        .toList();
  }
}
