import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:fruithub/core/utils/app_text_styles.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(1),
          side: WidgetStateProperty.all(
            const BorderSide(color: AppColors.primaryColor),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppTextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
