import 'package:flutter/material.dart';

import 'active_step_item.dart';
import 'inactive_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  List<String> get steps => ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        steps.length, 
        (index) =>
            index == 0
                ? ActiveStepItem(stepName: steps[index])
                : InactiveStepItem(
                  stepName: steps[index],
                  stepNumber: index + 1,
                ),
      ),
    );
  }
}
