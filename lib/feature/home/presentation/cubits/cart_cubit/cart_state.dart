part of 'cart_cubit.dart';

final class CartCubitAdd extends CartState {}

final class CartCubitInitial extends CartState {}

final class CartCubitRemove extends CartState {}

@immutable
sealed class CartState {}
