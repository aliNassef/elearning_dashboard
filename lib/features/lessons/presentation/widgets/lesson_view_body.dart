import 'package:elearning_dashboard/core/shared/widgets/default_app_button.dart';
import 'package:elearning_dashboard/core/utils/app_constants.dart';
import 'package:elearning_dashboard/features/lessons/domain/entity/lesson_entity.dart';
import 'package:elearning_dashboard/features/lessons/presentation/manger/lesson_cubit/lesson_cubit.dart';
import 'package:elearning_dashboard/features/lessons/presentation/widgets/lesson_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/shared/functions/build_loading_box.dart';
import '../../../../core/shared/functions/toast_dialog.dart';
import '../../../../core/utils/app_color.dart';

/*
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String courseId;
   */
class LessonViewBody extends StatefulWidget {
  const LessonViewBody({
    super.key,
  });

  @override
  State<LessonViewBody> createState() => _LessonViewBodyState();
}

class _LessonViewBodyState extends State<LessonViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController id = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController videoUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.kHorizontalPadding,
        vertical: 8.h,
      ),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: _formKey,
          child: Column(
            children: [
              LessonInputField(
                title: 'Lesson Number',
                hint: 'enter lesson number',
                controller: id,
              ),
              LessonInputField(
                title: 'Lesson Title',
                hint: 'enter lesson title',
                controller: title,
              ),
              LessonInputField(
                title: 'Lesson description',
                maxLines: 3,
                hint: 'enter lesson description',
                controller: desc,
              ),
              LessonInputField(
                title: 'Lesson Video URL',
                hint: 'enter lesson video url',
                controller: videoUrl,
              ),
              BlocListener<LessonCubit, LessonState>(
                listener: (context, state) {
                  if (state is LessonSuccess) {
                    Navigator.pop(context);
                    showToast(text: 'Lesson added successfully');
                  }

                  if (state is LessonFailure) {
                    Navigator.pop(context);
                    buildErrorMessage(
                      context,
                      errMessage: state.errMessage,
                    );
                  }
                  if (state is LessonLoading) {
                    buildLoadingBox(context);
                  }
                },
                child: DefaultAppButton(
                  onPressed: () {
                    final LessonEntity lesson = LessonEntity(
                      courseId: '555',
                      description: desc.text,
                      id: id.text.toLowerCase(),
                      title: title.text,
                      videoUrl: videoUrl.text,
                    );
                    context.read<LessonCubit>().addLesson(lesson: lesson);
                  },
                  text: 'Save',
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
    desc.dispose();
    videoUrl.dispose();
    super.dispose();
  }
}
