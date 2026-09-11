import 'package:hive/hive.dart';

import '../models/cart_item.dart';
import '../models/course_model.dart';

class CartLocalDataSource {
  final Box<CartItem> cartBox;

  CartLocalDataSource({required this.cartBox});

  Future<void> addToCart(CourseModel course) async {
    final existingCourse = cartBox.values.any(
      (item) => item.course.id == course.id,
    );

    if (existingCourse) {
      return;
    }

    await cartBox.put(course.id, CartItem(course: course));
  }

  List<CartItem> getCartItems() {
    return cartBox.values.toList();
  }

  Future<void> removeFromCart(int courseId) async {
    await cartBox.delete(courseId);
  }
}
