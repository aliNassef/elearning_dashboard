import 'package:dartz/dartz.dart';
import '../entity/course_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class CoursesRepo {
  Future<Either<Failure, void>> addCourse(CourseEntity course);
}
