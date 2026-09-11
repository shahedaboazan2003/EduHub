import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../repos/favorite_repository.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoriteRepository favoriteRepository;

  FavoriteProvider({required this.favoriteRepository});

  List<CourseModel> favoriteCourses = [];

  Future<void> loadFavoriteCourses() async {
    favoriteCourses = favoriteRepository.getFavoriteCourses();

    notifyListeners();
  }

  Future<void> toggleFavorite({required CourseModel course}) async {
    await favoriteRepository.toggleFavorite(course: course);

    final isCurrentlyFavorite = favoriteCourses.any(
      (element) => element.id == course.id,
    );

    if (isCurrentlyFavorite) {
      favoriteCourses = favoriteCourses
          .where((element) => element.id != course.id)
          .toList();
    } else {
      favoriteCourses = [...favoriteCourses, course];
    }

    notifyListeners();
  }

  bool isCourseFavorite(CourseModel course) {
    return favoriteCourses.any((element) => element.id == course.id);
  }
}
