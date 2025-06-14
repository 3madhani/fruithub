import '../order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromOrderEntity(OrderEntity order) => Details(
    subtotal: order.cartEntity.totalPrice.toString(),
    shipping: order.calculateShippingCost().toString(),
    shippingDiscount: order.calculateShippingDiscount(),
  );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
