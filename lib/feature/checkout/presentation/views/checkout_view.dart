import 'package:flutter/material.dart';

import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const String routeName = 'checkout_view';
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CheckoutViewBody());
  }
}
