part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionFailure extends QuestionState {
  final String errMessage;

  QuestionFailure({required this.errMessage});
}

final class QuestionSuccess extends QuestionState {}
