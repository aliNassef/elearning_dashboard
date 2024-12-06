import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'review_model.dart';

import '../../domain/entity/course_entity.dart';

class CourseModel {
  final String courseId;
  final String title;
  final String description;
  final String category;
  final String thumbnailUrl;
  final File thumbnail;
  final String createdBy; // userId of the teacher
  final DateTime? createdAt;
  final String price;
  final String discount;
  final List<ReviewModel> reviews;
  CourseModel({
    required this.reviews,
    required this.courseId,
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnailUrl,
    required this.createdBy,
    required this.price,
    required this.discount,
    this.createdAt,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'title': title,
      'reviews': reviews.map((e) => e.toMap()).toList(),
      'description': description,
      'category': category,
      'thumbnailUrl': thumbnailUrl,
      'createdBy': createdBy,
      'price': price,
      'discount': discount,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }

  factory CourseModel.fromEntity(CourseEntity course) {
    return CourseModel(
      reviews:
          course.reviewEntity.map((e) => ReviewModel.fromEntity(e)).toList(),
      courseId: course.courseCode,
      title: course.courseTitle,
      description: course.courseDescription,
      category: course.category,
      thumbnailUrl: course.thumnailUrl ?? '',
      createdBy: course.createdBy,
      createdAt: DateTime.now(),
      price: course.price,
      discount: course.discount,
      thumbnail: course.thumnail,
    );
  }
}
