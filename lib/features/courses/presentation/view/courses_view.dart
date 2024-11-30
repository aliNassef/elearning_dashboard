import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/courses_view_body.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});
  static const routeName = 'courses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Add Course',
          style: AppStyles.textStyle16SB.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: const SafeArea(
        child: CoursesViewBody(),
      ),
    );
  }
}
