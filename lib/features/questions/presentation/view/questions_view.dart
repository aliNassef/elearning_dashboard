import 'package:elearning_dashboard/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/questions_view_body.dart';

class QuestionsView extends StatelessWidget {
  final int questionsNumber;
  const QuestionsView({super.key, required this.questionsNumber});
  static const routeName = 'questions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Questions'),
      body: QuestionsViewBody(
        numOfQuestions: questionsNumber,
      ),
    );
  }
}
