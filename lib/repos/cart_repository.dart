import '../datasources/cart_local_datasource.dart';
import '../models/course_model.dart';

class CartRepository {
  final CartLocalDataSource cartLocalDataSource;

  CartRepository({required this.cartLocalDataSource});

  Future<void> addToCart(CourseModel course) async {
    await cartLocalDataSource.addToCart(course);
  }

  Future<List<CourseModel>> getCartItems() async {
    final cartItems = cartLocalDataSource.getCartItems();

    return cartItems.map((item) => item.course).toList();
  }

  Future<void> removeFromCart(int courseId) async {
    await cartLocalDataSource.removeFromCart(courseId);
  }
}
