import 'dart:developer';
import 'package:elearning_dashboard/core/shared/functions/toast_dialog.dart';
import 'package:elearning_dashboard/features/courses/presentation/view/courses_view.dart';
import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/shared/functions/build_loading_box.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_constants.dart';
import 'questions_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/question_entity.dart';
import '../manger/questioncubit/question_cubit.dart';

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.numOfQuestions,
    required this.page,
    required this.currentPage,
    required this.quizId,
  });
  final int numOfQuestions;
  final PageController page;
  final int currentPage;
  final String quizId;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController question = TextEditingController();
  TextEditingController choiceA = TextEditingController();
  TextEditingController choiceB = TextEditingController();
  TextEditingController choiceC = TextEditingController();
  TextEditingController choiceD = TextEditingController();
  TextEditingController correctAnswer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.kHorizontalPadding,
        vertical: 8.h,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              QuestionInputField(
                hint: 'enter question',
                title: 'Question ${widget.currentPage + 1}',
                controller: question,
              ),
              QuestionInputField(
                hint: 'enter choice',
                title: 'Choice A',
                controller: choiceA,
              ),
              QuestionInputField(
                hint: 'enter choice',
                title: 'Choice B',
                controller: choiceB,
              ),
              QuestionInputField(
                hint: 'enter choice',
                title: 'Choice C',
                controller: choiceC,
              ),
              QuestionInputField(
                hint: 'enter choice',
                title: 'Choice D',
                controller: choiceD,
              ),
              QuestionInputField(
                keyboardType: TextInputType.number,
                hint: 'enter answer',
                title: 'Correct Answer',
                controller: correctAnswer,
              ),
              BlocListener<QuestionCubit, QuestionState>(
                listener: (context, state) {
                  if (state is QuestionSuccess) {
                    Navigator.pop(context);
                    showToast(text: 'questions added');
                    Navigator.pushReplacementNamed(
                      context,
                      CoursesView.routeName,
                    );
                  } else if (state is QuestionFailure) {
                    Navigator.pop(context);
                    buildErrorMessage(context, errMessage: state.errMessage);
                  } else {
                    buildLoadingBox(context);
                  }
                },
                child: DefaultAppButton(
                  onPressed: () {
                    addQuestuins(context);
                  },
                  text: 'Next',
                  backgroundColor: AppColors.primaryColor,
                  textColor: Colors.white,
                ),
              ),
              const VerticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }

  void addQuestuins(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var input = QuestionEntity(
        quizId: widget.quizId,
        corrextAnswer: int.parse(correctAnswer.text),
        options: [choiceA.text, choiceB.text, choiceC.text, choiceD.text],
        question: question.text,
      );

      AppConstants.questions.add(input);
      log(AppConstants.questions.toString());

      if (widget.page.page == widget.numOfQuestions - 1) {
        // add to database
        context.read<QuestionCubit>().addQuestions(
              AppConstants.questions,
            );
      }
      widget.page.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    question.dispose();
    choiceA.dispose();
    choiceB.dispose();
    choiceC.dispose();
    choiceD.dispose();
    correctAnswer.dispose();
    super.dispose();
  }
}
