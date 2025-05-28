import 'package:dartz/dartz.dart';
import 'package:fruits_hub_admin/core/errors/failures.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders();
}