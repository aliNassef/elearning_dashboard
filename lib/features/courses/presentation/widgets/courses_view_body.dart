import 'dart:developer';
import 'dart:io';
import 'package:elearning_dashboard/core/shared/functions/build_error_message.dart';
import 'package:elearning_dashboard/features/courses/domain/entity/course_entity.dart';
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
  // The form key to validate the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // The auto validation mode of the form
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // The text editing controllers for the course's properties
  final TextEditingController courseCode = TextEditingController();
  final TextEditingController courseTitle = TextEditingController();
  final TextEditingController courseDescription = TextEditingController();
  final TextEditingController courseCategory = TextEditingController();
  final TextEditingController courseCreatedBy = TextEditingController();
  final TextEditingController coursePrice = TextEditingController();
  final TextEditingController courseDiscount = TextEditingController();
  File? image;

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
              CourseInputField(
                controller: courseCode,
                title: 'Course Code',
                hint: 'enter course code',
              ),
              CourseInputField(
                controller: courseTitle,
                title: 'Course Title',
                hint: 'enter course name',
              ),
              CourseInputField(
                controller: courseDescription,
                title: 'Course description',
                hint: 'enter course description',
                maxLines: 3,
              ),
              CourseInputField(
                controller: courseCategory,
                title: 'Course Category',
                hint: 'enter course category',
              ),
              CourseInputField(
                controller: courseCreatedBy,
                title: 'Created By',
                hint: 'enter instructor name',
              ),
              CourseInputField(
                controller: coursePrice,
                title: 'Course Price',
                hint: 'enter course price',
              ),
              CourseInputField(
                controller: courseDiscount,
                title: 'Course Discount',
                hint: 'enter course discount',
              ),
              Text(
                'Upload thumbnail',
                style: AppStyles.textStyle14R,
                textAlign: TextAlign.start,
              ),
              const VerticalSpace(8),
              PickThumbnail(
                valueChanged: (value) => image = value,
              ),
              const VerticalSpace(16),
              DefaultAppButton(
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final course = CourseEntity(
                        price: coursePrice.text,
                        discount: courseDiscount.text,
                        thumnail: image!,
                        courseCode: courseCode.text.toLowerCase(),
                        courseTitle: courseTitle.text,
                        courseDescription: courseDescription.text,
                        category: courseCategory.text,
                        createdBy: courseCreatedBy.text,
                      );
                      log(course.toString());
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    buildErrorMessage(
                      context,
                      errMessage: 'Please upload thumbnail',
                    );
                  }
                },
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
