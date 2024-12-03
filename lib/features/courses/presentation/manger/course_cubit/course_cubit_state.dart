part of 'course_cubit_cubit.dart';

@immutable
sealed class CourseState {}

final class CourseCubitInitial extends CourseState {}

final class CourseCubitSuccess extends CourseState {}

final class CourseCubitFailure extends CourseState {
  final String errMessage;

  CourseCubitFailure({required this.errMessage});
}

final class CourseCubitLoading extends CourseState {}
