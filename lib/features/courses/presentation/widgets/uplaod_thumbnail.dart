import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_images.dart';

class UploadThumbnail extends StatefulWidget {
  const UploadThumbnail({
    super.key,
  });

  @override
  State<UploadThumbnail> createState() => _UploadThumbnailState();
}

class _UploadThumbnailState extends State<UploadThumbnail> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          await uploadImage();
          isLoading = false;
          setState(() {});
        },
        child: Container(
          width: context.width,
          height: context.height * .3,
          decoration: BoxDecoration(
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
      ),
    );
  }

  Future<void> uploadImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      log('something went wrong when upload image');
    }
  }
}
