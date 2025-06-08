import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/entities/product_entity.dart';

import '../../../domain/entities/cart_entity.dart';
import '../../../domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartEntity cartEntity = CartEntity(cartItems: []);

  CartCubit() : super(CartCubitInitial());

  void addProduct(ProductEntity productEntity) {
    // check if the product is already in the cart
    bool isProductExist = cartEntity.isExist(productEntity);

    if (isProductExist) {
      // if the product is already in the cart, increase the count
      cartEntity.increaseCount(productEntity);
    } else {
      CartItemEntity cartItemEntity = CartItemEntity(
        productEntity: productEntity,
        count: 1,
      );
      cartEntity.addCartItem(cartItemEntity);
    }

    emit(CartCubitAdd());
  }

  void removeItem() {
    emit(CartCubitRemove());
  }
}
