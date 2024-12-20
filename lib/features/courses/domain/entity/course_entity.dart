import 'dart:io';

import 'review_entity.dart';

class CourseEntity {
  final String courseCode;
  final String courseTitle;
  final String courseDescription;
  final String category;
  final String createdBy;
  final File thumnail;
  String? thumnailUrl;
  final String price;
  final String discount;
  final List<ReviewEntity> reviewEntity;
  CourseEntity({
    required this.reviewEntity,
    required this.price,
    required this.discount,
    required this.thumnail,
    required this.courseCode,
    required this.courseTitle,
    required this.courseDescription,
    required this.category,
    required this.createdBy,
    this.thumnailUrl,
  });
}
