import 'package:flutter/material.dart';
import 'package:fruits_hub_admin/core/utils/constants/sizes.dart';
import 'package:fruits_hub_admin/core/widgets/custom_button.dart';
import 'package:fruits_hub_admin/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_admin/features/orders/presentation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
            text: 'Add Data',
          ),
          const SizedBox(height: Sizes.md),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, OrdersView.routeName);
            },
            text: 'View Orders',
          ),
        ],
      ),
    );
  }
}
