import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_admin/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  final OrdersRepo ordersRepo;
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());

  Future<void> fetchOrders() async {
    emit(FetchOrdersLoading());
    try {
      final failureOrOrders = await ordersRepo.fetchOrders();

      failureOrOrders.fold(
        (failure) => emit(FetchOrdersError(message: failure.message)),
        (orders) => emit(FetchOrdersSuccess(orders: orders)),
      );

    } catch (e) {
      emit(FetchOrdersError(message: e.toString()));
    }
  }
}
