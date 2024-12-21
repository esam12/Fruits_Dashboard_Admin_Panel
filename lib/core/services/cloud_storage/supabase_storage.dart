import 'dart:io';

import 'package:fruits_hub_admin/core/services/cloud_storage/cloud_storage.dart';
import 'package:fruits_hub_admin/core/utils/keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements CloudStorage {
  static late Supabase _supabase;

  static Future<void> initialize() async {

    _supabase = await Supabase.initialize(
      url: KSupabaseUrl,
      anonKey: KSupabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) {
    throw UnimplementedError();
    
  }
}
