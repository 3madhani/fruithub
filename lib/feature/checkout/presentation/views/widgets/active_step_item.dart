import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  final String stepName;

  const ActiveStepItem({super.key, required this.stepName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.check, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 4),
        Text(
          stepName,
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
