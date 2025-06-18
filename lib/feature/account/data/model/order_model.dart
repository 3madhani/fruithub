import '../../domain/entities/order_entity.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final List<OrderProductModel> orderProducts;
  final String status;
  final DateTime date;
  final String orderId;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.orderProducts,
    required this.status,
    required this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderId: json['orderId'] as String,
    totalPrice: json['totalPrice'] as double,
    orderProducts:
        (json['orderProducts'] as List)
            .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
    status: json['status'] as String,
    date: DateTime.parse(json['date'] as String),
  );

  OrderEntity toEntity() => OrderEntity(
    status: status,
    orderId: orderId,
    totalPrice: totalPrice,
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    date: date,
  );
}
