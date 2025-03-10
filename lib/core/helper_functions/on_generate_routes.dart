import 'package:flutter/material.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_admin/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_admin/features/orders/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Dashboard Screen
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

    // Order Screen
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());

    // Add Product Screen
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
