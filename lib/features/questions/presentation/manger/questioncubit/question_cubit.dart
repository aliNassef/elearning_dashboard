import 'package:elearning_dashboard/features/questions/domain/entity/question_entity.dart';
import 'package:elearning_dashboard/features/questions/domain/repo/questions_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this.questionsRepo) : super(QuestionInitial());
  final QuestionsRepo questionsRepo;
  void addQuestions(List<QuestionEntity> questions) async {
    emit(QuestionLoading());
    var data = await questionsRepo.addQuestions(questions);
    data.fold(
      (l) => emit(QuestionFailure(errMessage: l.errMessage)),
      (r) => emit(QuestionSuccess()),
    );
  }
}
