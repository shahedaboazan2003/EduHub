import 'package:flutter/material.dart';

import '../models/course_model.dart';
import 'course_provider.dart';

class SearchProvider extends ChangeNotifier {
  // final CourseProvider courseProvider;

  // SearchProvider({required this.courseProvider});

  String searchQuery = '';

  void updateQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void clear() {
    searchQuery = '';
    notifyListeners();
  }

  // List<CourseModel> get searchResults {
  //   if (searchQuery.trim().isEmpty) {
  //     return courseProvider.courses;
  //   }

  //   final query = searchQuery.trim().toLowerCase();

  //   return courseProvider.courses.where((course) {
  //     return course.name.toLowerCase().contains(query);
  //   }).toList();
  // }
}
