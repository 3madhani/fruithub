import 'package:flutter/material.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/inactive_step_item.dart';

import '../../../../../core/constants/app_const.dart';

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
          InactiveStepItem(),
        ],
      ),
    );
  }
}
