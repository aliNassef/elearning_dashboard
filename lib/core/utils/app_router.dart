import '../../features/courses/presentation/view/courses_view.dart';
import 'package:flutter/material.dart';

import '../../features/lessons/presentation/view/lesson_view.dart';
import '../../features/questions/presentation/view/questions_view.dart';
import '../../features/quizes/presentation/view/quize_view.dart';
import '../shared/widgets/custom_no_internet_widget.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CoursesView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const CoursesView();
        },
      );
    case LessonView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const LessonView();
        },
      );
    case QuizeView.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const QuizeView();
        },
      );
    case QuestionsView.routeName:
      var arguments = settings.arguments as Map<String, dynamic>;
      int numOfQQuestions = int.parse(arguments['questionsNumber']);
      String quizId = arguments['quizId'];
      return MaterialPageRoute(
        builder: (_) {
          return QuestionsView(
            quizId: quizId,
            questionsNumber: numOfQQuestions,
          );
        },
      );
    case CustomNoInternetWidget.routeName:
      return MaterialPageRoute(
        builder: (_) {
          return const CustomNoInternetWidget();
        },
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
