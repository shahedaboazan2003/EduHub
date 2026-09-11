// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'review_model.dart';

class CourseModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final String instructorName;
  final String instructorTitle;
  final int price;
  final String image;
  final int enrolledStudents;
  final double rating;
  final int reviewsCount;
  final List<String> whatYouWillLearn;
  final String lastUpdated;
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

  CourseModel copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? instructorName,
    String? instructorTitle,
    int? price,
    String? image,
    int? enrolledStudents,
    double? rating,
    int? reviewsCount,
    List<String>? whatYouWillLearn,
    String? lastUpdated,
    List<ReviewModel>? reviews,
  }) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      instructorName: instructorName ?? this.instructorName,
      instructorTitle: instructorTitle ?? this.instructorTitle,
      price: price ?? this.price,
      image: image ?? this.image,
      enrolledStudents: enrolledStudents ?? this.enrolledStudents,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      whatYouWillLearn: whatYouWillLearn ?? this.whatYouWillLearn,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'instructorName': instructorName,
      'instructorTitle': instructorTitle,
      'price': price,
      'image': image,
      'enrolledStudents': enrolledStudents,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'whatYouWillLearn': whatYouWillLearn,
      'lastUpdated': lastUpdated,
      'reviews': reviews.map((x) => x.toMap()).toList(),
    };
  }

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
    whatYouWillLearn:
        List<String>.from(map['what_you_will_learn'] as List),
    lastUpdated: map['last_updated'] as String,
    reviews: (map['reviews'] as List)
        .map(
          (review) => ReviewModel.fromMap(
            review as Map<String, dynamic>,
          ),
        )
        .toList(),
  );
}

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) => CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseModel(id: $id, name: $name, description: $description, category: $category, instructorName: $instructorName, instructorTitle: $instructorTitle, price: $price, image: $image, enrolledStudents: $enrolledStudents, rating: $rating, reviewsCount: $reviewsCount, whatYouWillLearn: $whatYouWillLearn, lastUpdated: $lastUpdated, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.category == category &&
      other.instructorName == instructorName &&
      other.instructorTitle == instructorTitle &&
      other.price == price &&
      other.image == image &&
      other.enrolledStudents == enrolledStudents &&
      other.rating == rating &&
      other.reviewsCount == reviewsCount &&
      listEquals(other.whatYouWillLearn, whatYouWillLearn) &&
      other.lastUpdated == lastUpdated &&
      listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      category.hashCode ^
      instructorName.hashCode ^
      instructorTitle.hashCode ^
      price.hashCode ^
      image.hashCode ^
      enrolledStudents.hashCode ^
      rating.hashCode ^
      reviewsCount.hashCode ^
      whatYouWillLearn.hashCode ^
      lastUpdated.hashCode ^
      reviews.hashCode;
  }
}
