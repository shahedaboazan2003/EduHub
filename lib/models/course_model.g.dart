// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewModelAdapter extends TypeAdapter<ReviewModel> {
  @override
  final int typeId = 0;

  @override
  ReviewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewModel(
      reviewerName: fields[0] as String,
      reviewDate: fields[1] as String,
      reviewContent: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.reviewerName)
      ..writeByte(1)
      ..write(obj.reviewDate)
      ..writeByte(2)
      ..write(obj.reviewContent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CourseModelAdapter extends TypeAdapter<CourseModel> {
  @override
  final int typeId = 1;

  @override
  CourseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseModel(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      category: fields[3] as String,
      instructorName: fields[4] as String,
      instructorTitle: fields[5] as String,
      price: fields[6] as int,
      image: fields[7] as String,
      enrolledStudents: fields[8] as int,
      rating: fields[9] as double,
      reviewsCount: fields[10] as int,
      whatYouWillLearn: (fields[11] as List).cast<String>(),
      lastUpdated: fields[12] as String,
      reviews: (fields[13] as List).cast<ReviewModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.instructorName)
      ..writeByte(5)
      ..write(obj.instructorTitle)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.enrolledStudents)
      ..writeByte(9)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.reviewsCount)
      ..writeByte(11)
      ..write(obj.whatYouWillLearn)
      ..writeByte(12)
      ..write(obj.lastUpdated)
      ..writeByte(13)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
