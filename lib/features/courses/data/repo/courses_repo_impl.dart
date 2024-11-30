import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../source/courses_remote_source.dart';

import '../../domain/repo/courses_repo.dart';
import '../model/course_model.dart';

class CoursesRepoImpl extends CoursesRepo {
  final CoursesRemoteSource coursesRemoteSource;

  CoursesRepoImpl({required this.coursesRemoteSource});
  @override
  Future<Either<Failure, void>> addCourse(CourseModel course) async {
    try {
      await coursesRemoteSource.addCourse(course);
      return right(null);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
