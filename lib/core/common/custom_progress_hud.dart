import 'package:flutter/material.dart';
import 'package:fruithub/core/utils/app_colors.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressHUD extends StatelessWidget {
  final bool isLoading;

  final Widget child;
  const CustomProgressHUD({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: AppColors.primaryLightColor,
        strokeWidth: 2,
      ),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
