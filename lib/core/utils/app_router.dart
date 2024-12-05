import '../../features/courses/presentation/view/courses_view.dart';
import 'package:flutter/material.dart';

import '../../features/lessons/presentation/view/lesson_view.dart';
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
