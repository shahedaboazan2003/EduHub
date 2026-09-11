import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../repos/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository cartRepository;

  CartProvider({required this.cartRepository});

  List<CourseModel> cartItems = [];

  bool isLoading = false;

  Future<void> loadCartItems() async {
    isLoading = true;
    notifyListeners();

    try {
      cartItems = await cartRepository.getCartItems();
    } catch (e) {
      print('CART LOAD ERROR: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addToCart(CourseModel course) async {
    final alreadyExists = cartItems.any((item) => item.id == course.id);

    if (alreadyExists) {
      return false;
    }

    await cartRepository.addToCart(course);

    cartItems.add(course);

    notifyListeners();

    return true;
  }

  Future<void> removeFromCart(CourseModel course) async {
    await cartRepository.removeFromCart(course.id);

    cartItems.removeWhere((item) => item.id == course.id);

    notifyListeners();
  }

  double get subtotal {
    return cartItems.fold(0, (sum, course) => sum + course.price);
  }
}
