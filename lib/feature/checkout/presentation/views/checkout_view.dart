import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/helper/get_user_entity_function.dart';
import '../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../../core/services/get_it_services.dart';
import '../../../home/domain/entities/cart_entity.dart';
import '../../domain/entities/order_input_entity.dart';
import '../../domain/entities/shipping_address_entity.dart';
import '../manager/add_order_cubit/add_order_cubit.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  static const String routeName = 'checkout_view';
  final CartEntity cartEntity;

  const CheckoutView({super.key, required this.cartEntity});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late final OrderInputEntity _orderEntity;
  final GlobalKey<CheckoutViewBodyState> checkoutBodyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(ordersRepo: getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'الشحن'),
        body: Provider<OrderInputEntity>.value(
          value: _orderEntity,
          child: CheckoutViewBody(key: checkoutBodyKey),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _orderEntity = OrderInputEntity(
      uId: getUserEntity().uId,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
  }
}
