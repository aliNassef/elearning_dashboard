import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../errors/failure.dart';
import 'image_repo.dart';
import '../../services/storage_service.dart';

import '../../services/endpoints.dart';

class ImageRepImpl extends ImageRepo {
  final StorageService storageService;

  ImageRepImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage({required File image}) async {
    try {
      final url =
          await storageService.uploadFile(file: image, path: Endpoints.images);
      return right(url);
    } catch (e) {
      return left(
        Failure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
