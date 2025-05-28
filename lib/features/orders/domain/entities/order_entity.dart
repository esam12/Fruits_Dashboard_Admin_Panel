import 'package:fruits_hub_admin/core/enums/order_enum.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final num totalPrice;
  final String uId;
  final String orderID;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatusEnum status;


  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    required this.orderID,
  });


}
