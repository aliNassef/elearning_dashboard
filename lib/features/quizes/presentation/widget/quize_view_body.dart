import 'package:elearning_dashboard/features/questions/presentation/view/questions_view.dart';

import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/utils/app_constants.dart';
import '../manger/quiz_cubit/quiz_cubit.dart';
import 'quize_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/shared/functions/build_loading_box.dart';
import '../../../../core/utils/app_color.dart';
import '../../domain/entity/quize_entity.dart';

class QuizeViewBody extends StatefulWidget {
  const QuizeViewBody({
    super.key,
  });

  @override
  State<QuizeViewBody> createState() => _QuizeViewBodyState();
}

class _QuizeViewBodyState extends State<QuizeViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController numOfQuestions = TextEditingController();
  TextEditingController quizTime = TextEditingController();

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
              QuizeInputField(
                title: 'Number',
                hint: 'enter quiz number',
                controller: id,
              ),
              QuizeInputField(
                title: 'Title',
                hint: 'enter quiz title',
                controller: title,
              ),
              QuizeInputField(
                keyboardtype: TextInputType.number,
                title: 'Questions Number',
                hint: 'enter quiz questions number',
                controller: numOfQuestions,
              ),
              QuizeInputField(
                keyboardtype: TextInputType.number,
                title: 'Quiz Time',
                hint: 'enter quiz time',
                controller: quizTime,
              ),
              BlocListener<QuizCubit, QuizState>(
                listener: (context, state) {
                  if (state is QuizSuccess) {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                      context,
                      QuestionsView.routeName,
                      arguments: {
                        'questionsNumber': numOfQuestions.text,
                        'quizId': id.text,
                      },
                    );
                  }
                  if (state is QuizFailure) {
                    Navigator.pop(context);
                    buildErrorMessage(
                      context,
                      errMessage: state.errMessage,
                    );
                  }
                  if (state is QuizLoading) {
                    buildLoadingBox(context);
                  }
                },
                child: DefaultAppButton(
                  text: 'Next',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final quize = QuizeEntity(
                        id: id.text,
                        title: title.text,
                        courseId: '555',
                        duration: int.parse(quizTime.text),
                      );
                      context.read<QuizCubit>().addQuize(quize);
                    } else {
                      buildErrorMessage(
                        context,
                        errMessage: 'All fields are required',
                      );
                    }
                  },
                  backgroundColor: AppColors.primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    id.dispose();
    title.dispose();
    numOfQuestions.dispose();
    super.dispose();
  }
}
