import '../../../domain/repo/lesson_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/lesson_entity.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit(this._lessonRepo) : super(LessonInitial());
  final LessonRepo _lessonRepo;

  void addLesson({required LessonEntity lesson}) async {
    emit(LessonLoading());
    final result = await _lessonRepo.addLesson(leesson: lesson);
    result.fold(
      (failure) => emit(
        LessonFailure(errMessage: failure.errMessage),
      ),
      (r) => emit(
        LessonSuccess(),
      ),
    );
  }
}
