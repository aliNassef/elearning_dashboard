import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text(
       title,
        style: AppStyles.textStyle16SB.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
