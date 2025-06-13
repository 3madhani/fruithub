import 'package:flutter/material.dart';
import 'package:fruithub/feature/home/domain/entities/cart_item_entity.dart';

import '../../../../core/common/custom_app_bar.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  static const String routeName = 'checkout_view';

  const CheckoutView({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'الشحن'),
      body: const CheckoutViewBody(),
    );
  }
}
