import 'package:fruithub/core/entities/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  double get totalPrice {
    double total = 0.0;
    for (var cartItem in cartItems) {
      total += cartItem.totalPrice;
    }
    return total;
  }

  addCartItem({required CartItemEntity cartItemEntity}) {
    cartItems.add(cartItemEntity);
  }

  CartItemEntity? getCartItem(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (productEntity == cartItem.productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (productEntity == cartItem.productEntity) {
        return true;
      }
    }
    return false;
  }

  removeCartItem({required CartItemEntity cartItemEntity}) {
    cartItems.remove(cartItemEntity);
  }
}
