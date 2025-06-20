import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper/get_dummy_orders.dart';
import '../../manager/fetch_orders/fetch_orders_cubit.dart';
import '../../manager/fetch_orders/fetch_orders_state.dart';
import 'order_widget.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersLoading) {
          return Skeletonizer(child: OrderWidget(order: getDummyOrder()));
        }
        if (state is FetchOrdersError) {
          return Center(child: Text(state.message));
        }
        if (state is FetchOrdersLoaded) {
          return ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              return OrderWidget(order: state.orders[index]);
            },
          );
        }
        return const Center(child: Text("Something went wrong"));
      },
    );
  }
}
