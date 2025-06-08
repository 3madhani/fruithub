part of 'cart_cubit.dart';

final class CartProductAdded extends CartState {}

final class CarttInitial extends CartState {}

final class CartProductRemoveed extends CartState {}

@immutable
sealed class CartState {}
