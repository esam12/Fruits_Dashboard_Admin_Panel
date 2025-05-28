import 'package:dartz/dartz.dart';
import 'package:fruits_hub_admin/core/errors/failures.dart';
import 'package:fruits_hub_admin/core/services/data_service.dart';
import 'package:fruits_hub_admin/core/utils/constants/backend_end_points.dart';
import 'package:fruits_hub_admin/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_admin/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final data =
          await databaseService.getData(path: BackendEndPoints.getOrders);
      List<OrderEntity> orders = (data as List<dynamic>)
          .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
          .toList();
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
