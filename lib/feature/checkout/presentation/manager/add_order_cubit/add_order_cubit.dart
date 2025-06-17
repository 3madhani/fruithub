import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/core/repos/orders_repo/orders_repo.dart';

import '../../../domain/entities/order_input_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrdersRepo ordersRepo;
  AddOrderCubit({required this.ordersRepo}) : super(AddOrderInitial());

  void addOrder({required OrderInputEntity orderEntity}) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure) => emit(AddOrderError(message: failure.message)), (
      r,
    ) {
      emit(AddOrderSuccess());
    });
  }
}
