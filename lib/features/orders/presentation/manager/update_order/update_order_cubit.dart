import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/enums/order_enum.dart';
import 'package:fruits_hub_admin/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  final OrdersRepo ordersRepo;
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());

  Future<void> updateOrder(
      {required OrderStatusEnum status, required String orderId}) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepo.updateOrder(status: status, orderId: orderId);
    result.fold(
      (failure) => emit(UpdateOrderError(message: failure.message)),
      (r) => emit(UpdateOrderSuccess()),
    );
  }
}
