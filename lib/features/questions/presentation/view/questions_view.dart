import 'package:elearning_dashboard/core/services/service_locator.dart';
import 'package:elearning_dashboard/core/shared/widgets/custom_app_bar.dart';
import 'package:elearning_dashboard/features/questions/presentation/manger/questioncubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repo/questions_repo.dart';
import '../widgets/questions_view_body.dart';

class QuestionsView extends StatelessWidget {
  final int questionsNumber;
  const QuestionsView({super.key, required this.questionsNumber});
  static const routeName = 'questions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Questions'),
      body: BlocProvider(
        create: (context) => QuestionCubit(injector<QuestionsRepo>()),
        child: QuestionsViewBody(
          numOfQuestions: questionsNumber,
        ),
      ),
    );
  }
}
