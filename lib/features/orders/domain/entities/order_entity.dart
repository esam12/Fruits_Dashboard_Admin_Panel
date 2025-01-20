import 'package:fruits_hub_admin/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final num totalPrice;
  final String uId;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
  });

  toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      shippingAddressEntity: shippingAddressEntity.toEntity(),
      orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }
}
