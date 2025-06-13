import 'package:flutter/material.dart';
import 'package:fruithub/feature/checkout/domain/entities/order_entity.dart';
import 'package:fruithub/feature/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/custom_app_bar.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  static const String routeName = 'checkout_view';

  final CartEntity cartEntity;

  const CheckoutView({super.key, required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'الشحن'),
      body: Provider.value(
        value: OrderEntity(cartEntity: cartEntity),
        child: const CheckoutViewBody(),
      ),
    );
  }
}
