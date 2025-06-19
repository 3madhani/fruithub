// orders_state.dart
import 'package:equatable/equatable.dart';

import '../../../domain/entities/order_entity.dart';

class FetchOrdersError extends FetchOrdersState {
  final String message;

  const FetchOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class FetchOrdersLoaded extends FetchOrdersState {
  final List<OrderEntity> orders;

  const FetchOrdersLoaded(this.orders);

  @override
  List<Object?> get props => [orders];
}

class FetchOrdersLoading extends FetchOrdersState {}

abstract class FetchOrdersState extends Equatable {
  const FetchOrdersState();
  @override
  List<Object?> get props => [];
}

class OrdersInitial extends FetchOrdersState {}
