import 'package:uuid/uuid.dart';

import '../../domain/entities/order_input_entity.dart';
import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final String uid;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.uid,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) => OrderModel(
    orderId: const Uuid().v4(),
    totalPrice: orderEntity.cartEntity.totalPrice,
    shippingAddressModel: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddress,
    ),
    uid: orderEntity.uId,
    orderProducts:
        orderEntity.cartEntity.cartItems
            .map((e) => OrderProductModel.fromCartItemEntity(e))
            .toList(),
    paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
  );

  toJson() => {
    'orderId': orderId,
    'totalPrice': totalPrice,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'uid': uid,
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}

// total price
// shipping address
// Uid
// List<Order> =[ ]
// payment method
