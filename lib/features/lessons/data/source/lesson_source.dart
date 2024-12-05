import 'package:elearning_dashboard/core/errors/error_model.dart';
import 'package:elearning_dashboard/features/lessons/data/model/lesson_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firestore_database.dart';

class LessonSource {
  final FirestoreService service;

  LessonSource({required this.service});

  Future<void> addLesson(LessonModel lesson) async {
    try {
      await service.addLesson(
        lesson.courseId,
        lesson.toMap(),
      );
    } catch (e) {
      throw ServerException(
        ErrorModel(errorMessage: 'failed to add lesson'),
      );
    }
  }
}
