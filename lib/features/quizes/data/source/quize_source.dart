import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firestore_database.dart';
import '../model/quize_model.dart';

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
