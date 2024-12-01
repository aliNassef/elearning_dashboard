import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_constants.dart';
import 'course_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import 'uplaod_thumbnail.dart';

class CoursesViewBody extends StatefulWidget {
  const CoursesViewBody({
    super.key,
  });

  @override
  State<CoursesViewBody> createState() => _CoursesViewBodyState();
}

class _CoursesViewBodyState extends State<CoursesViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CourseInputField(
                title: 'Course Code',
                hint: 'enter course code',
              ),
              const CourseInputField(
                title: 'Course Title',
                hint: 'enter course name',
              ),
              const CourseInputField(
                title: 'Course description',
                hint: 'enter course description',
                maxLines: 3,
              ),
              const CourseInputField(
                title: 'Course Category',
                hint: 'enter course category',
              ),
              const CourseInputField(
                title: 'Created By',
                hint: 'enter instructor name',
              ),
              const CourseInputField(
                title: 'Course Price',
                hint: 'enter course price',
              ),
              const CourseInputField(
                title: 'Course Discount',
                hint: 'enter course discount',
              ),
              Text(
                'Upload thumbnail',
                style: AppStyles.textStyle14R,
                textAlign: TextAlign.start,
              ),
              const VerticalSpace(8),
              const UploadThumbnail(),
              const VerticalSpace(16),
              const DefaultAppButton(
                text: 'Save',
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
              const VerticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}
