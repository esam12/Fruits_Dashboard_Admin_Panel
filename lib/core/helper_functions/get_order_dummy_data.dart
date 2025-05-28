
import 'package:fruits_hub_admin/core/enums/order_enum.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_admin/features/orders/domain/entities/shipping_address_entity.dart';


OrderEntity getDummyOrder() {
  // Create a sample shipping address
  ShippingAddressEntity shippingAddress = ShippingAddressEntity(
    name: 'John Doe',
    phoneNumber: '123-456-7890',
    address: '123 Main St',
    addressDetails: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // Create a sample list of order products
  List<OrderProductEntity> orderProducts = [
    OrderProductEntity(
      name: 'Product A',
      code: 'A123',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Product B',
      code: 'B456',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Product C',
      code: 'C789',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 19.99,
      quantity: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );

  // Create and return the OrderModel
  return OrderEntity(
    orderID: '12345',
    totalPrice: totalPrice,
    status: OrderStatusEnum.pending,
    uId: 'user123',
    shippingAddressEntity: shippingAddress,
    orderProducts: orderProducts,
    paymentMethod: 'Cash',
  );
}