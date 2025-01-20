class OrderProductEntity {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final num quantity;

  OrderProductEntity({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  OrderProductEntity toEntity() => OrderProductEntity(
        name: name,
        code: code,
        imageUrl: imageUrl,
        price: price,
        quantity: quantity,
      );
}
