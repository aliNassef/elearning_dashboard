import 'package:dartz/dartz.dart';
import 'package:elearning_dashboard/core/errors/failure.dart';
import 'package:elearning_dashboard/features/questions/data/model/question_model.dart';
import 'package:elearning_dashboard/features/questions/domain/entity/question_entity.dart';
import 'package:elearning_dashboard/features/questions/domain/repo/questions_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../source/questions_source.dart';

class QuestionsRepoImpl extends QuestionsRepo {
  final QuestionsSource questionsSource;

  QuestionsRepoImpl({required this.questionsSource});
  @override
  Future<Either<Failure, void>> addQuestions(
      List<QuestionEntity> questions) async {
    try {
      await questionsSource.addQuestiosn(
        '555',
        questions.first.quizId,
        questions.map((e) => QuestionModel.fromEntity(e)).toList(),
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
