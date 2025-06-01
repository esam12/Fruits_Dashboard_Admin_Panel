import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_admin/core/enums/order_enum.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_admin/features/orders/presentation/manager/update_order/update_order_cubit.dart';

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({super.key, required this.orderModel});
  final OrderEntity orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderModel.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                  status: OrderStatusEnum.accepted,
                  orderId: orderModel.orderID);
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderModel.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                  status: OrderStatusEnum.cancelled,
                  orderId: orderModel.orderID);
            },
            child: const Text('Reject'),
          ),
        ),
        Visibility(
          visible: orderModel.status == OrderStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                  status: OrderStatusEnum.delivered,
                  orderId: orderModel.orderID);
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
