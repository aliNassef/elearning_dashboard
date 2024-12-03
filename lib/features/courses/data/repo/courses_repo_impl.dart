import 'package:dartz/dartz.dart';
import 'package:elearning_dashboard/features/courses/domain/entity/course_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../source/courses_remote_source.dart';

import '../../domain/repo/courses_repo.dart';
import '../model/course_model.dart';

class CoursesRepoImpl extends CoursesRepo {
  final CoursesRemoteSource coursesRemoteSource;

  CoursesRepoImpl({required this.coursesRemoteSource});
  @override
  Future<Either<Failure, void>> addCourse(CourseEntity course) async {
    try {
      await coursesRemoteSource.addCourse(CourseModel.fromEntity(course));
      return right(null);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
