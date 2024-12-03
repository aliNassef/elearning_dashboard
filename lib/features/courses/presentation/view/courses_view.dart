import 'package:elearning_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:elearning_dashboard/core/services/service_locator.dart';
import 'package:elearning_dashboard/features/courses/presentation/manger/course_cubit/course_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../domain/repo/courses_repo.dart';
import '../widgets/courses_view_body.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});
  static const routeName = 'courses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocProvider(
        create: (context) => CourseCubit(
          injector<ImageRepo>(),
          injector<CoursesRepo>(),
        ),
        child: const SafeArea(
          child: CoursesViewBody(),
        ),
      ),
    );
  }
}
