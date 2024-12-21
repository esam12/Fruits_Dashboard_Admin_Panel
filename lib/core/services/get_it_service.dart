import 'package:fruits_hub_admin/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_admin/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/cloud_storage.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/supabase_storage.dart';
import 'package:fruits_hub_admin/core/services/data_service.dart';
import 'package:fruits_hub_admin/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Cloud Storage Firebase
  //getIt.registerSingleton<CloudStorage>(FirebaseCloudStorage());

  // Cloud Storage Supabase
  getIt.registerSingleton<CloudStorage>(SupabaseStorageService());

  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(cloudStorage: getIt.get<CloudStorage>()));

  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(databaseService: getIt.get<DatabaseService>()));
}
