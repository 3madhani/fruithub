import 'package:flutter/material.dart';

import '../../../../../core/constants/app_const.dart';
import 'checkout_steps.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConst.horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: AppConst.verticalPadding),
          CheckoutSteps(),
          SizedBox(height: AppConst.verticalPadding),
        ],
      ),
    );
  }
}
