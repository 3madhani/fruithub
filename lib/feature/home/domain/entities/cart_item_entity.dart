import 'package:equatable/equatable.dart';
import 'package:fruithub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  final int quantity;

  const CartItemEntity({required this.productEntity, this.quantity = 0});

  @override
  List<Object?> get props => [productEntity, quantity];

  num get totalPrice => productEntity.price * quantity;

  num get totalWeight => productEntity.unitAmount * quantity;

  /// Returns a new instance with quantity decreased (min 0)
  CartItemEntity decreaseQuantity() {
    return CartItemEntity(
      productEntity: productEntity,
      quantity: quantity > 0 ? quantity - 1 : 0,
    );
  }

  /// Returns a new instance with quantity increased
  CartItemEntity increaseQuantity() {
    return CartItemEntity(productEntity: productEntity, quantity: quantity + 1);
  }
}
