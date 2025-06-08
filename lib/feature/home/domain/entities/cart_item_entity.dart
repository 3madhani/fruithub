import 'package:fruithub/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num get totalPrice => productEntity.price * count;

  num get totalWeight => productEntity.unitAmount * count;

  increaseCount() {
    count++;
  }

  decreaseCount() {
    if (count > 0) {
      count--;
    }
  }
}
