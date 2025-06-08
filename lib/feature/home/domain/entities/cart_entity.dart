import 'package:fruithub/core/entities/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (productEntity == cartItem.productEntity) {
        return true;
      }
    }
    return false;
  }

  increaseCount(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (productEntity == cartItem.productEntity) {
        cartItem.count++;
      }
    }
  }
}
