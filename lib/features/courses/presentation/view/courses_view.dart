import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../widgets/courses_view_body.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});
  static const routeName = 'courses';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: CoursesViewBody(),
      ),
    );
  }
}
