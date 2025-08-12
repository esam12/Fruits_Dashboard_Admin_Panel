import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_admin/core/errors/failures.dart';
import 'package:fruits_hub_admin/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_admin/core/services/data_service.dart';
import 'package:fruits_hub_admin/core/utils/constants/backend_end_points.dart';
import 'package:fruits_hub_admin/features/add_product/data/models/product_model.dart';
import 'package:fruits_hub_admin/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductInputEntity) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection(BackendEndPoints.products)
          .doc();
      final docId = docRef.id;
      addProductInputEntity.id = docId;
      await databaseService.addData(
          path: BackendEndPoints.products,
          docuementId: docId,
          data: ProductModel.fromEntity(addProductInputEntity).toJson());

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
