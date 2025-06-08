import 'package:flutter/material.dart';

import '../../../../core/common/custom_app_bar.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  static const String routeName = 'checkout_view';

  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'الشحن'),
      body: const CheckoutViewBody(),
    );
  }
}
