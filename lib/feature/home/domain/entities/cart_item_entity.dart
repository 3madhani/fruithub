import 'package:equatable/equatable.dart';
import 'package:fruithub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  @override
  List<Object?> get props => [productEntity];

  num get totalPrice => productEntity.price * quantity;

  num get totalWeight => productEntity.unitAmount * quantity;

  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  increaseQuantity() {
    quantity++;
  }
}
