import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_constants.dart';
import 'course_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import 'uplaod_thumbnail.dart';

class CoursesViewBody extends StatelessWidget {
  const CoursesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.kHorizontalPadding,
        vertical: 8.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CourseInputField(
              title: 'Course Id',
              hint: 'enter course id',
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
    );
  }
}
