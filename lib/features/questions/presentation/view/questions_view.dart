import 'package:elearning_dashboard/core/services/service_locator.dart';
import 'package:elearning_dashboard/core/shared/widgets/custom_app_bar.dart';
import 'package:elearning_dashboard/features/questions/presentation/manger/questioncubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repo/questions_repo.dart';
import '../widgets/questions_view_body.dart';

class QuestionsView extends StatelessWidget {
  static const routeName = 'questions';
  final int questionsNumber;
  final String quizId;

  const QuestionsView({
    super.key,
    required this.questionsNumber,
    required this.quizId,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Questions'),
      body: BlocProvider(
        create: (context) => QuestionCubit(injector<QuestionsRepo>()),
        child: QuestionsViewBody(
          quizId: quizId,
          numOfQuestions: questionsNumber,
        ),
      ),
    );
  }
}
