import 'package:flutter/material.dart';

import 'order_widget.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [OrderWidget()]);
  }
}
