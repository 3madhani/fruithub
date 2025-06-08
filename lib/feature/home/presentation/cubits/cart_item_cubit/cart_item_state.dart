part of 'cart_item_cubit.dart';

final class CartItemInitial extends CartItemState {}

sealed class CartItemState {
  const CartItemState();
}

final class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  const CartItemUpdated({required this.cartItemEntity});
}
