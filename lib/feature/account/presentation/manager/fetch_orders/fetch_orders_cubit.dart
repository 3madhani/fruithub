// orders_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/account/presentation/manager/fetch_orders/fetch_orders_state.dart';

import '../../../domain/entities/user_info_entity.dart';
import '../../../domain/repos/user_info_repo.dart';

class OrdersCubit extends Cubit<FetchOrdersState> {
  final UserInfoRepo userInfoRepo;

  OrdersCubit(this.userInfoRepo) : super(OrdersInitial());

  Future<void> fetchOrders(UserInfoEntity user) async {
    emit(FetchOrdersLoading());
    final result = await userInfoRepo.getOrdersOfUser(user);
    result.fold(
      (failure) => emit(FetchOrdersError(failure.message)),
      (orders) => emit(FetchOrdersLoaded(orders)),
    );
  }
}
