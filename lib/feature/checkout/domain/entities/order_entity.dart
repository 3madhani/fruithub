import 'package:fruithub/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruithub/feature/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.cartEntity,
    required this.shippingAddress,
    this.payWithCash,
  });
}
