import 'package:flutter/material.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruithub/feature/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  final String stepName;

  final int stepNumber;

  final bool isActive;

  const StepItem({
    super.key,
    required this.stepName,
    required this.stepNumber,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(stepName: stepName, stepNumber: stepNumber),
      secondChild: ActiveStepItem(stepName: stepName),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
