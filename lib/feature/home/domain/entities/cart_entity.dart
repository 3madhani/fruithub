import 'package:fruithub/core/entities/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem({ required CartItemEntity cartItemEntity}) {
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

  CartItemEntity? getCartItem(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (productEntity == cartItem.productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }
  increaseCount(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (productEntity == cartItem.productEntity) {
        cartItem.count++;
      }
    }
  }
}
