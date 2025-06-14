import 'package:flutter/material.dart';
import 'package:fruithub/core/helper/get_user_entity_function.dart';
import 'package:fruithub/feature/checkout/domain/entities/order_entity.dart';
import 'package:fruithub/feature/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../domain/entities/shipping_address_entity.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  static const String routeName = 'checkout_view';
  final CartEntity cartEntity;

  const CheckoutView({super.key, required this.cartEntity});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late final OrderEntity _orderEntity;
  final GlobalKey<CheckoutViewBodyState> checkoutBodyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'الشحن'),
      body: Provider<OrderEntity>.value(
        value: _orderEntity,
        child: CheckoutViewBody(key: checkoutBodyKey),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _orderEntity = OrderEntity(
      uId: getUserEntity().uId,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
  }
}
