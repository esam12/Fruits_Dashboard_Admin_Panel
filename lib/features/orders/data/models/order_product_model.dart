import 'package:fruits_hub_admin/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final num quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: json['price'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  // toEntity
  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }
}
