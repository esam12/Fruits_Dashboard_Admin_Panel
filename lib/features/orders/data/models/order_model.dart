import 'package:fruits_hub_admin/core/enums/order_enum.dart';
import 'package:fruits_hub_admin/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_admin/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final num totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderID;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    this.status,
    required this.orderID,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'] ?? 0,
      uId: json['uId'] ?? '',
      status: json['status'] ?? '',
      orderID: json['orderId'] ?? '',
      shippingAddressModel:
          ShippingAddressModel.fromJson(json['shippingAddressModel']),
      orderProducts: List<OrderProductModel>.from(
          json['orderProducts'].map((e) => OrderProductModel.fromJson(e))),
      paymentMethod: json['paymentMethod'] ?? '',
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'Pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  toEntity() => OrderEntity(
        orderID: orderID,
        totalPrice: totalPrice,
        status: fetchEnum(),
        uId: uId,
        shippingAddressEntity: shippingAddressModel.toEntity(),
        orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
        paymentMethod: paymentMethod,
      );
  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
