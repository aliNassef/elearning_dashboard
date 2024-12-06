import 'dart:developer';

import 'package:elearning_dashboard/core/shared/widgets/default_app_button.dart';
import 'package:elearning_dashboard/core/shared/widgets/spacers.dart';
import 'package:elearning_dashboard/core/utils/app_color.dart';
import 'package:elearning_dashboard/core/utils/app_constants.dart';
import 'package:elearning_dashboard/features/questions/presentation/widgets/questions_input_field.dart';
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
  });
  final int numOfQuestions;
  final PageController page;
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
                title: 'Question ${(widget.page.page?.round() ?? 0) + 1}',
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
                listener: (context, state) {},
                child: DefaultAppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var input = QuestionEntity(
                        corrextAnswer: int.parse(correctAnswer.text),
                        options: [
                          choiceA.text,
                          choiceB.text,
                          choiceC.text,
                          choiceD.text
                        ],
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
