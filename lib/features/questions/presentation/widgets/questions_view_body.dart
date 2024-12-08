import 'package:elearning_dashboard/features/questions/presentation/widgets/question.dart';
import 'package:flutter/material.dart';

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({super.key, required this.numOfQuestions, required this.quizId});
  final int numOfQuestions;
  final String quizId;
  @override
  State<QuestionsViewBody> createState() => _QuestionsViewBodyState();
}

class _QuestionsViewBodyState extends State<QuestionsViewBody> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) {
        return Question(
          quizId: widget.quizId,
          currentPage: index,
          page: pageController,
          numOfQuestions: widget.numOfQuestions,
        );
      },
      itemCount: widget.numOfQuestions,
    );
  }
}
