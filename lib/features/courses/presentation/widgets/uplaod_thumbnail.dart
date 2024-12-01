import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_images.dart';

class PickThumbnail extends StatefulWidget {
  const PickThumbnail({super.key, required this.valueChanged});
  final ValueChanged<File?> valueChanged;
  @override
  State<PickThumbnail> createState() => _PickThumbnailState();
}

class _PickThumbnailState extends State<PickThumbnail> {
  bool isLoading = false;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          image = await pickImage();
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: context.width,
              height: context.height * .3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.gray100Color,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: image != null
                      ? FileImage(image!)
                      : const AssetImage(AppImages.addImages),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            Visibility(
              visible: image != null,
              child: Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {
                    image = null;
                    widget.valueChanged(image);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<File?> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      final fileImage = File(image!.path);
      widget.valueChanged(fileImage);
      return fileImage;
    } catch (e) {
      log('something went wrong when upload image');
      return null;
    }
  }
}
