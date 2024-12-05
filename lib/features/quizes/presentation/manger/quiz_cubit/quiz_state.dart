part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

final class QuizFailure extends QuizState {
  final String errMessage;

  QuizFailure({required this.errMessage});
}

final class QuizLoading extends QuizState {}

final class QuizSuccess extends QuizState {}
