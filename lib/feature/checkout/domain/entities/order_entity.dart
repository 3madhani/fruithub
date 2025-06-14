import 'package:fruithub/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruithub/feature/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddress = ShippingAddressEntity();

  OrderEntity({
    required this.cartEntity,
    this.shippingAddress,
    this.payWithCash,
  });
}
