import '../../../domain/repo/quize_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/quize_entity.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(this._quizeRepo) : super(QuizInitial());
  final QuizeRepo _quizeRepo;

  void addQuize(QuizeEntity quize) async {
    emit(QuizLoading());
    final result = await _quizeRepo.addQuize(quize);
    result.fold(
      (l) => emit(
        QuizFailure(errMessage: l.errMessage),
      ),
      (r) => emit(
        QuizSuccess(),
      ),
    );
  }
}
