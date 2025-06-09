import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xFFF2F3F3),
          child: Text("2", style: AppTextStyles.semiBold13),
        ),
        const SizedBox(width: 4),
        Text(
          "العنوان",
          style: AppTextStyles.semiBold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
