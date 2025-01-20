import 'package:flutter/material.dart';
import 'package:fruits_hub_admin/features/orders/presentation/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrdersViewBody(),
    );
  }
}