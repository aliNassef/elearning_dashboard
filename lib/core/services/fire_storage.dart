import 'dart:io';

import 'storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

class FireStorage extends StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    var fileName = b.basename(file.path);
    var extensionName = b.extension(file.path);
    final fileRef = storageRef.child('$path/$fileName.$extensionName');
    await fileRef.putFile(file);
    final fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
