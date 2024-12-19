import 'package:dartz/dartz.dart';
import 'package:fruits_hub_admin/core/errors/failures.dart';
import 'package:fruits_hub_admin/features/add_product/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity inputEntity);
}
