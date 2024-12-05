import 'package:elearning_dashboard/features/lessons/domain/entity/lesson_entity.dart';

class LessonModel {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String courseId;

  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.courseId,
  });

  factory LessonModel.fromEntity(LessonEntity json) => LessonModel(
        id: json.id,
        title: json.title,
        description: json.description,
        videoUrl: json.videoUrl,
        courseId: json.courseId,
      );

  toMap() => {
        'lessonId': id,
        'title': title,
        'description': description,
        'videoUrl': videoUrl,
        'courseId': courseId
      };
}
