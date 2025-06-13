import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  final String stepName;

  final int stepNumber;
  const InactiveStepItem({
    super.key,
    required this.stepName,
    required this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xFFF2F3F3),
          child: Text("$stepNumber", style: AppTextStyles.semiBold13),
        ),
        const SizedBox(width: 4),
        Text(
          stepName,
          style: AppTextStyles.semiBold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
