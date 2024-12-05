import 'package:dartz/dartz.dart';
import 'package:elearning_dashboard/core/errors/failure.dart';
import 'package:elearning_dashboard/features/lessons/data/model/lesson_model.dart';
import 'package:elearning_dashboard/features/lessons/domain/entity/lesson_entity.dart';
import 'package:elearning_dashboard/features/lessons/domain/repo/lesson_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../source/lesson_source.dart';

class LessonRepoImpl extends LessonRepo {
  final LessonSource source;

  LessonRepoImpl({required this.source});
  @override
  Future<Either<Failure, void>> addLesson(
      {required LessonEntity leesson}) async {
    try {
      await source.addLesson(
        LessonModel.fromEntity(leesson),
      );
      return right(null);
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
