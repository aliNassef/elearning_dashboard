import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String courseId;
  final String title;
  final String description;
  final String category;
  final String thumbnailUrl;
  final String createdBy; // userId of the teacher
  final DateTime? createdAt;

  CourseModel({
    required this.courseId,
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnailUrl,
    required this.createdBy,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'thumbnailUrl': thumbnailUrl,
      'createdBy': createdBy,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
