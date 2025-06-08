import 'package:equatable/equatable.dart';
import 'package:fruithub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  @override
  List<Object?> get props => [productEntity];

  num get totalPrice => productEntity.price * count;

  num get totalWeight => productEntity.unitAmount * count;

  decreaseCount() {
    if (count > 0) {
      count--;
    }
  }

  increaseCount() {
    count++;
  }
}
