import 'package:dartz/dartz.dart';
import '../entity/lesson_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class LessonRepo {
  Future<Either<Failure, void>> addLesson({required LessonEntity leesson});
}
