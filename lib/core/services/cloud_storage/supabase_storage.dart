import 'dart:io';

import 'package:fruits_hub_admin/core/services/cloud_storage/cloud_storage.dart';

class SupabaseStorage implements CloudStorage {
  @override
  Future<String> uploadFile(File file, String path) {
    throw UnimplementedError();
    
  }

}