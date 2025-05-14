import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 116,
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.all(3),
        ),
        onPressed: onPressed,
        child: Text(
          "تسوق الان",
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
