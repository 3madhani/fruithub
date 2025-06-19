import 'package:flutter/material.dart';

import '../../../../core/common/custom_app_bar.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const String routeName = 'Orders_View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'طلباتي',),
      body: const OrdersViewBody(),
    );
  }
}