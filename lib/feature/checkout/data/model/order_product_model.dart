import '../../../home/domain/entities/cart_item_entity.dart';

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

  factory OrderProductModel.fromCartItemEntity(CartItemEntity cartItemEntity) {
    return OrderProductModel(
      name: cartItemEntity.productEntity.title,
      code: cartItemEntity.productEntity.code,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      price: cartItemEntity.productEntity.price.toDouble(),
      quantity: cartItemEntity.quantity,
    );
  }

  toJson() => {
    'name': name,
    'code': code,
    'quantity': quantity,
    'imageUrl': imageUrl,
    'price': price,
  };
}
