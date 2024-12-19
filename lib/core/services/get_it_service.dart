import 'package:fruits_hub_admin/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_admin/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/cloud_storage.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/firebase_cloud_storage.dart';
import 'package:fruits_hub_admin/core/services/data_service.dart';
import 'package:fruits_hub_admin/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<CloudStorage>(FirebaseCloudStorage());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(cloudStorage: getIt.get<CloudStorage>()));

  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(databaseService: getIt.get<DatabaseService>()));
}
