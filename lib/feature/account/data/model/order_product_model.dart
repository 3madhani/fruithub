
import '../../domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final int quantity;
  final String imageUrl;
  final double price;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        name: json['name'] as String,
        code: json['code'] as String,
        quantity: json['quantity'] as int,
        imageUrl: json['imageUrl'] as String,
        price: json['price'] as double,
      );

  OrderProductEntity toEntity() => OrderProductEntity(
    name: name,
    code: code,
    imageUrl: imageUrl,
    price: price,
    quantity: quantity,
  );
}
