import 'package:fruithub/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruithub/feature/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.cartItems,
    required this.shippingAddress,
    required this.payWithCash,
  });
}
