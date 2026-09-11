import 'package:flutter/material.dart';

import '../models/course_model.dart';

class CartProvider extends ChangeNotifier {
  List<CourseModel> cartItems = [];

  void addToCart(CourseModel course) {
    if (cartItems.any((item) => item.id == course.id)) {
      return;
    }

    cartItems.add(course);
    notifyListeners();
  }

  void removeFromCart(CourseModel course) {
    cartItems.remove(course);
    notifyListeners();
  }

  double get subtotal {
    return cartItems.fold(0, (sum, course) => sum + course.price);
  }
}
