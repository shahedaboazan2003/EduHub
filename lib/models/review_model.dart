// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReviewModel {
  final String reviewerName;
  final String reviewDate;
  final String reviewContent;
  ReviewModel({
    required this.reviewerName,
    required this.reviewDate,
    required this.reviewContent,
  });

  ReviewModel copyWith({
    String? reviewerName,
    String? reviewDate,
    String? reviewContent,
  }) {
    return ReviewModel(
      reviewerName: reviewerName ?? this.reviewerName,
      reviewDate: reviewDate ?? this.reviewDate,
      reviewContent: reviewContent ?? this.reviewContent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reviewerName': reviewerName,
      'reviewDate': reviewDate,
      'reviewContent': reviewContent,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewerName: map['reviewer_name'] as String,
      reviewDate: map['review_date'] as String,
      reviewContent: map['review_content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) => ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ReviewModel(reviewerName: $reviewerName, reviewDate: $reviewDate, reviewContent: $reviewContent)';

  @override
  bool operator ==(covariant ReviewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.reviewerName == reviewerName &&
      other.reviewDate == reviewDate &&
      other.reviewContent == reviewContent;
  }

  @override
  int get hashCode => reviewerName.hashCode ^ reviewDate.hashCode ^ reviewContent.hashCode;
}
