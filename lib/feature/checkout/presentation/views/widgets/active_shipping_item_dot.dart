import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ActiveShippItemDot extends StatelessWidget {
  const ActiveShippItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: AppColors.primaryColor,
        shape: OvalBorder(side: BorderSide(color: Colors.white, width: 4)),
      ),
    );
  }
}
