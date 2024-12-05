import 'package:elearning_dashboard/core/services/service_locator.dart';
import 'package:elearning_dashboard/core/shared/widgets/custom_app_bar.dart';
import 'package:elearning_dashboard/features/lessons/domain/repo/lesson_repo.dart';
import 'package:elearning_dashboard/features/lessons/presentation/manger/lesson_cubit/lesson_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/lesson_view_body.dart';

class LessonView extends StatelessWidget {
  const LessonView({super.key});
  static const routeName = 'lesson';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Lesson',
      ),
      body: BlocProvider(
        create: (context) => LessonCubit(
          injector<LessonRepo>(),
        ),
        child: const SafeArea(
          child: LessonViewBody(),
        ),
      ),
    );
  }
}
