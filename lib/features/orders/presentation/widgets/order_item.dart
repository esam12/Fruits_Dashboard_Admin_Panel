import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_admin/core/enums/order_enum.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_admin/features/orders/presentation/widgets/order_action_button.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderEntity orderModel;

  const OrderItemWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Price
            Row(
              children: [
                Text(
                  'Total Price: \$${orderModel.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: orderModel.status == OrderStatusEnum.pending
                        ? Colors.yellow.shade700
                        : orderModel.status == OrderStatusEnum.accepted
                            ? Colors.green
                            : orderModel.status == OrderStatusEnum.delivered
                                ? Colors.blue
                                : Colors.red,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    orderModel.status.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),

            // User ID
            Text(
              'User ID: ${orderModel.uId}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // Shipping Address
            const Text(
              'Shipping Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              orderModel.shippingAddressEntity.getAddress(),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),

            // Payment Method
            Text(
              'Payment Method: ${orderModel.paymentMethod}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Order Products
            const Text(
              'Products:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderModel.orderProducts.length,
              itemBuilder: (context, index) {
                final product = orderModel.orderProducts[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'Quantity: ${product.quantity} | Price: \$${product.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),
            OrderActionButton(orderModel: orderModel),
          ],
        ),
      ),
    );
  }
}
