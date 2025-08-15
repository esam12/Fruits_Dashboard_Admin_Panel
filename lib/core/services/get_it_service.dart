import 'package:fruits_hub_admin/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_admin/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/cloud_storage.dart';
import 'package:fruits_hub_admin/core/services/cloud_storage/supabase_storage.dart';
import 'package:fruits_hub_admin/core/services/data_service.dart';
import 'package:fruits_hub_admin/core/services/firestore_service.dart';
import 'package:fruits_hub_admin/features/notification/data/repos/notification_repository_impl.dart';
import 'package:fruits_hub_admin/features/notification/domain/repos/notification_repository.dart';
import 'package:fruits_hub_admin/features/orders/data/repos/orders_repo_impl.dart';
import 'package:fruits_hub_admin/features/orders/domain/repos/orders_repo.dart';
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

  getIt.registerSingleton<OrdersRepo>(
      OrdersRepoImpl(databaseService: getIt.get<DatabaseService>()));

  getIt.registerSingleton<NotificationRepository>(
      NotificationRepositoryImpl(getIt.get<DatabaseService>()));
}
