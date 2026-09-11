import 'package:hive/hive.dart';

part 'course_model.g.dart';

@HiveType(typeId: 0)
class ReviewModel {
  @HiveField(0)
  final String reviewerName;

  @HiveField(1)
  final String reviewDate;

  @HiveField(2)
  final String reviewContent;

  ReviewModel({
    required this.reviewerName,
    required this.reviewDate,
    required this.reviewContent,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewerName: map['reviewer_name'] as String,
      reviewDate: map['review_date'] as String,
      reviewContent: map['review_content'] as String,
    );
  }
}

@HiveType(typeId: 1)
class CourseModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final String instructorName;

  @HiveField(5)
  final String instructorTitle;

  @HiveField(6)
  final int price;

  @HiveField(7)
  final String image;

  @HiveField(8)
  final int enrolledStudents;

  @HiveField(9)
  final double rating;

  @HiveField(10)
  final int reviewsCount;

  @HiveField(11)
  final List<String> whatYouWillLearn;

  @HiveField(12)
  final String lastUpdated;

  @HiveField(13)
  final List<ReviewModel> reviews;

  CourseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.instructorName,
    required this.instructorTitle,
    required this.price,
    required this.image,
    required this.enrolledStudents,
    required this.rating,
    required this.reviewsCount,
    required this.whatYouWillLearn,
    required this.lastUpdated,
    required this.reviews,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      instructorName: map['instructor_name'] as String,
      instructorTitle: map['instructor_title'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
      enrolledStudents: map['enrolled_students'] as int,
      rating: (map['rating'] as num).toDouble(),
      reviewsCount: map['reviews_count'] as int,
      whatYouWillLearn: List<String>.from(map['what_you_will_learn'] as List),
      lastUpdated: map['last_updated'] as String,
      reviews: (map['reviews'] as List)
          .map((review) => ReviewModel.fromMap(review as Map<String, dynamic>))
          .toList(),
    );
  }
}
