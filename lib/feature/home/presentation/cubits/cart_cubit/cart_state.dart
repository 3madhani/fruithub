part of 'cart_cubit.dart';

final class CartItemRemoved extends CartState {}

final class CartProductAdded extends CartState {}

// final class CartProductRemoved extends CartState {}

@immutable
sealed class CartState {}

final class CarttInitial extends CartState {}
