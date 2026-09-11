import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../repos/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository courseRepository;

  CourseProvider({required this.courseRepository});

  List<CourseModel> courses = [];

  bool isLoading = false;
  String errorMessage = '';
  List<String> get categories {
    return courses.map((course) => course.category).toSet().toList();
  }

  Future<void> getCourses() async {
    isLoading = true;
    errorMessage = '';

    notifyListeners();

    try {
      courses = await courseRepository.getCourses();

      print('COURSES COUNT: ${courses.length}');

      for (final course in courses) {
        print('COURSE: ${course.name}');
      }
    } catch (e) {
      print('COURSES ERROR: $e');

      errorMessage = 'Failed to load courses';
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }
}
