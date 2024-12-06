import 'package:elearning_dashboard/core/services/firestore_database.dart';
import 'package:elearning_dashboard/features/questions/data/model/question_model.dart';

import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

class QuestionsSource {
  final FirestoreService firestoreService;

  QuestionsSource({required this.firestoreService});

  Future<void> addQuestiosn(
      String courseId, String quizId, List<QuestionModel> questions) async {
    try {
      List<Map<String, dynamic>> questionsMap =
          questions.map((e) => e.toMap()).toList();
      await firestoreService.addQuestions(courseId, quizId, questionsMap);
    } catch (e) {
      throw ServerException(
        ErrorModel(errorMessage: 'Failed to add questions'),
      );
    }
  }
}
