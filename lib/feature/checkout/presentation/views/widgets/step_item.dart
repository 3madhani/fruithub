import 'package:flutter/material.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  final String stepName;

  final int stepNumber;
  const StepItem({super.key, required this.stepName, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(stepName: stepName, stepNumber: stepNumber),
      secondChild: InactiveStepItem(stepName: stepName, stepNumber: stepNumber),
      crossFadeState:
          stepNumber == 0
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }
}
