import 'package:flutter/material.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/step_item.dart';

List<String> get steps => ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        steps.length,
        (index) => StepItem(stepName: steps[index], stepNumber: index + 1),
      ),
    );
  }
}
