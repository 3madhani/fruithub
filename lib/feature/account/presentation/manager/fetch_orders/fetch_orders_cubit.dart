import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_info_entity.dart';
import '../../../domain/repos/user_info_repo.dart';
import 'fetch_orders_state.dart';

class OrdersCubit extends Cubit<FetchOrdersState> {
  final UserInfoRepo userInfoRepo;
  StreamSubscription? _ordersSubscription;

  OrdersCubit(this.userInfoRepo) : super(OrdersInitial());

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }

  /// Call this when you want to start listening to the user's orders
  void fetchOrders(UserInfoEntity user) {
    emit(FetchOrdersLoading());

    // Cancel any previous subscription
    _ordersSubscription?.cancel();

    // Listen to the updated order stream
    _ordersSubscription = userInfoRepo.getOrdersOfUser(user).listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersError(failure.message)),
        (orders) => emit(FetchOrdersLoaded(orders)),
      );
    });
  }
}
