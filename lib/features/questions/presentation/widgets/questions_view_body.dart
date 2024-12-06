
import 'package:elearning_dashboard/features/questions/presentation/widgets/question.dart';
import 'package:flutter/material.dart';

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({super.key, required this.numOfQuestions});
  final int numOfQuestions;

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
      viewportFraction: 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return Question(
          page: pageController,
          currentPage: index,
        );
      },
      itemCount: widget.numOfQuestions,
    );
  }
}
