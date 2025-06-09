import 'package:flutter/material.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  final String stepName;

  final int stepNumber;

  const StepItem({super.key, required this.stepName, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(stepName: stepName, stepNumber: stepNumber),
      secondChild: ActiveStepItem(stepName: stepName),
      crossFadeState:
          stepNumber == 0
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
