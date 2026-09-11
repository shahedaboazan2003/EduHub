import '../datasources/favorite_local_datasource.dart';
import '../models/course_model.dart';

class FavoriteRepository {
  final FavoriteLocalDataSource favoriteLocalDataSource;

  FavoriteRepository({required this.favoriteLocalDataSource});

  List<CourseModel> getFavoriteCourses() {
    return favoriteLocalDataSource.getFavoriteCourses();
  }

  Future<void> toggleFavorite({required CourseModel course}) async {
    await favoriteLocalDataSource.toggleFavorite(course: course);
  }
}
