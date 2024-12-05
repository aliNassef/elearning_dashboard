import '../../../../../core/repos/image_repo/image_repo.dart';
import '../../../domain/entity/course_entity.dart';
import '../../../domain/repo/courses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'course_cubit_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this._imageRepo, this._coursesRepo) : super(CourseCubitInitial());
  final ImageRepo _imageRepo;
  final CoursesRepo _coursesRepo;

  void addCourse({required CourseEntity course}) async {
    emit(CourseCubitLoading());

    final image = await _imageRepo.uploadImage(image: course.thumnail);

    image.fold(
      (failure) => emit(
        CourseCubitFailure(errMessage: failure.errMessage),
      ),
      (imageUrl) async {
        course.thumnailUrl = imageUrl;

        final data = await _coursesRepo.addCourse(course);
        data.fold(
          (failure) => emit(
            CourseCubitFailure(errMessage: failure.errMessage),
          ),
          (_) {
            emit(
              CourseCubitSuccess(),
            );
          },
        );
      },
    );
  }
}
