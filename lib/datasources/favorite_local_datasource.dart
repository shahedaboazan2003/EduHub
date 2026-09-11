import 'package:hive/hive.dart';

import '../models/course_model.dart';

class FavoriteLocalDataSource {
  final Box<CourseModel> favoriteBox;

  FavoriteLocalDataSource({required this.favoriteBox});

  List<CourseModel> getFavoriteCourses() {
    return favoriteBox.values.toList();
  }

  Future<void> toggleFavorite({required CourseModel course}) async {
    if (favoriteBox.containsKey(course.id)) {
      await favoriteBox.delete(course.id);
    } else {
      await favoriteBox.put(course.id, course);
    }
  }
}
