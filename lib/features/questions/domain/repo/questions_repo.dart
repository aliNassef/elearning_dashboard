import 'package:dartz/dartz.dart';
import '../entity/question_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class QuestionsRepo {
  Future<Either<Failure, void>> addQuestions(List<QuestionEntity> questions);
}
