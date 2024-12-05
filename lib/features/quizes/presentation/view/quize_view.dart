import 'package:elearning_dashboard/core/services/service_locator.dart';
import 'package:elearning_dashboard/features/quizes/domain/repo/quize_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../manger/quiz_cubit/quiz_cubit.dart';
import '../widget/quize_view_body.dart';

class QuizeView extends StatelessWidget {
  const QuizeView({super.key});
  static const String routeName = 'quize-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Quiz'),
      body: BlocProvider(
        create: (context) => QuizCubit(
          injector<QuizeRepo>(),
        ),
        child: const SafeArea(
          child: QuizeViewBody(),
        ),
      ),
    );
  }
}
