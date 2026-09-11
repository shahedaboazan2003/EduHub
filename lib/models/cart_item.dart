import 'package:hive/hive.dart';

import 'course_model.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 2)
class CartItem extends HiveObject {
  @HiveField(0)
  final CourseModel course;

  CartItem({required this.course});
}
