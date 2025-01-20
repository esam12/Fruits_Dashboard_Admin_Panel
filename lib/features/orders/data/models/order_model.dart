import 'package:fruits_hub_admin/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_admin/features/orders/data/models/shipping_address_model.dart';

class OrderModel {
  final num totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      shippingAddressModel: ShippingAddressModel.fromJson(json['shippingAddressModel']),
      orderProducts: json['orderProducts'].map((e) => OrderProductModel.fromJson(e)).toList(),
      paymentMethod: json['paymentMethod'],
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'status': 'Pending',
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
