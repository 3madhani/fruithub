import 'package:fruithub/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruithub/feature/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.uId,
    required this.cartEntity,
    required this.shippingAddress,
    this.payWithCash,
  });

  double calculateShippingCost() {
    if (payWithCash == true) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPrice() {
    return cartEntity.totalPrice + calculateShippingCost() - calculateShippingDiscount();
  }

}
