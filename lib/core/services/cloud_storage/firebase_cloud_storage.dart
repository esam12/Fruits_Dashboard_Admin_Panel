import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/cloud_storage.dart';
import 'package:path/path.dart' as p;

class FirebaseCloudStorage implements CloudStorage {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(fileName);
    var imageReference =
        storageReference.child('$path/$fileName.$extensionName');

    await imageReference.putFile(file);

    return imageReference.getDownloadURL();
  }
}
