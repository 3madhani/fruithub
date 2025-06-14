import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/entities/product_entity.dart';

import '../../../domain/entities/cart_entity.dart';
import '../../../domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartEntity cartEntity = CartEntity(cartItems: []);

  CartCubit() : super(CarttInitial());

  void addProduct(ProductEntity productEntity) {
    // check if the product is already in the cart
    bool isProductExist = cartEntity.isExist(productEntity);

    var cartItem = cartEntity.getCartItem(productEntity);

    if (isProductExist) {
      // if the product is already in the cart, increase the count
      cartItem!.increaseQuantity();
    } else {
      cartEntity.addCartItem(cartItemEntity: cartItem!);
    }

    emit(CartProductAdded());
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity: cartItemEntity);
    ();
    emit(CartItemRemoved());
  }
}
