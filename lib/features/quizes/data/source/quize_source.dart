import 'package:elearning_dashboard/core/errors/error_model.dart';
import 'package:elearning_dashboard/core/errors/exceptions.dart';
import 'package:elearning_dashboard/core/services/firestore_database.dart';
import 'package:elearning_dashboard/features/quizes/data/model/quize_model.dart';

class QuizeSource {
  final FirestoreService firestoreService;

  QuizeSource({required this.firestoreService});
  Future<void> addQuize(QuizeModel quiz) async {
    try {
      await firestoreService.addQuiz(quiz.courseId, quiz.toMap());
    } catch (e) {
      throw ServerException(
        ErrorModel(errorMessage: 'Failed to add quize'),
      );
    }
  }
}
