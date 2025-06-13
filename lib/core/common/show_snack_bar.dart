import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class ShowSnackBar {
  static void showErrorSnackBar(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: const Duration(seconds: 1),
        content: Text(
          error,
          style: AppTextStyles.bold14,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.bold14,
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.primaryLightColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 10,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
