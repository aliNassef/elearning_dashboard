import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firestore_database.dart';
import '../model/course_model.dart';

class CoursesRemoteSource {
  final FirestoreService firestoreService;

  CoursesRemoteSource({required this.firestoreService});

  Future<void> addCourse(CourseModel course) async {
    try {
      await firestoreService.addCourse(course.toMap());
    } catch (e) {
      throw ServerException(
        ErrorModel(errorMessage: 'Failed to add course'),
      );
    }
  }
}
