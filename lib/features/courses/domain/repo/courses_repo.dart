import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/course_model.dart';

abstract class CoursesRepo {
  Future<Either<Failure, void>> addCourse(CourseModel course);
}
