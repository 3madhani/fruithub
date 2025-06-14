part of 'add_order_cubit.dart';

final class AddOrderError extends AddOrderState {
  final String message;
  const AddOrderError({required this.message});
}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

sealed class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object> get props => [];
}

final class AddOrderSuccess extends AddOrderState {}
