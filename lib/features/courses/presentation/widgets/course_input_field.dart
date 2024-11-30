import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CourseInputField extends StatelessWidget {
  const CourseInputField({
    super.key,
    required this.title,
    required this.hint,
    this.maxLines = 1,
  });
  final String title;
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle14R,
        ),
        const VerticalSpace(8),
        CustomTextFormField(
          maxLines: maxLines,
          hintText: hint,
          controller: TextEditingController(),
        ),
        const VerticalSpace(16),
      ],
    );
  }
}
