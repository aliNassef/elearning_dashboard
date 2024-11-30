import '../../../../core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_images.dart';

class UploadThumbnail extends StatelessWidget {
  const UploadThumbnail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: context.width,
        height: context.height * .3,
        decoration: BoxDecoration(
          // color: Colors.amber,
          border: Border.all(
            color: AppColors.gray100Color,
          ),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.addImages),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
